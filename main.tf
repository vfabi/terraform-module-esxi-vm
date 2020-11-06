locals {
    hostname = "${var.vm_name_base}-${var.vm_name_postfix}"
}


data "template_file" "cloudinit" {
    template = file("${path.module}/templates/userdata.tpl")
    vars = {
        HOSTNAME = local.hostname
        SSH_USER_NAME = var.vm_ssh_user_name
        SSH_USER_PASSWORD = var.vm_ssh_user_password
    }
}


resource "esxi_guest" "vm" {
    guest_name = local.hostname
    guestos = var.vm_os_type
    memsize = var.vm_spec_memory
    numvcpus = var.vm_spec_cpu_cores
    ovf_source = var.vm_image_template_file
    power = var.vm_poweron
    disk_store = var.esxi_datastore_name
    notes = var.vm_notes

    network_interfaces {
        virtual_network = var.esxi_network_name
    }

    guestinfo = {
        "userdata.encoding" = "gzip+base64"
        "userdata" = base64gzip(data.template_file.cloudinit.rendered)
    }
}