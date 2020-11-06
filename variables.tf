variable "esxi_datastore_name" {
    description = "ESXI datastore name."
    type = string
}

variable "esxi_network_name" {
    description = "ESXI network name."
    type = string
}

variable "vm_image_template_file" {
    description = "VM image template file absolute local path."
    type = string
}

variable "vm_os_type" {
    description = "VM os type."
    type = string
}

variable "vm_spec_cpu_cores" {
    description = "VM spec CPU cores count."
    type = string
    default = "1"
}

variable "vm_spec_memory" {
    description = "VM spec memory value in MB."
    type = string
    default = "512"
}

variable "vm_poweron" {
    description = "VM power on/off."
    type = string
    default = "on"
}

variable "vm_ssh_user_name" {
    description = "VM ssh user name."
    type = string
}

variable "vm_ssh_user_password" {
    description = "VM ssh user password."
    type = string
}

variable "vm_name_postfix" {
    description = "VM name postfix."
    type = string
}

variable "vm_name_base" {
    description = "VM name base."
    type = string
    default = "vm"
}