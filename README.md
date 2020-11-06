# VMware ESXI VM Terraform module
Terraform module which creates VM resources on VMware ESXI hypervisor host using `https://registry.terraform.io/providers/josenk/esxi/` provider.  
These types of resources are supported:  
- vm


## Features
The only external dependency is VMware ESXI host. No VMware vCenter required, no VMshpere Terraform provider required! Just your infracode + VM template files stored locally.


## Requirements
- VMware ESXI hypervisor host:
    - ESXI version >= 6.7
    - SSH enabled
- Localhost software:
    - Terraform >= 0.13.5
    - VMware ovftool >= 4.4.1 (https://my.vmware.com/web/vmware/details?productId=614&downloadGroup=OVFTOOL420)
    - OVA/OVF format VM template image with installed packages:
        - vm-open-tools (https://github.com/vmware/open-vm-tools/releases, for RHEL/CentOS you can just run `yum install open-vm-tools`)
        - cloud-init (for RHEL/CentOS you can use package https://github.com/vmware/cloud-init-vmware-guestinfo/releases/download/v1.1.0/cloud-init-vmware-guestinfo-1.1.0-1.el7.noarch.rpm)


## Providers
- esxi (https://registry.terraform.io/providers/josenk/esxi/)


## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| count | VM instances count to create. | number |  | yes |
| vm_name_base | VM instance name base. | string | `vm` | no |
| vm_os_type | VM os type supported by VMware ESXI. Examples: `centos7-64`. | string | | yes |
| vm_spec_memory | VM memory capacity spec. | string | `512` | no |
| vm_spec_cpu_cores | VM cpu core count spec. | string | `1` | no |
| vm_image_template_file | OVA/OVF format VM image template file absolute local path. | string | | yes |
| vm_poweron | VM power on/off. | string | `on` | no |
| vm_notes | VM notes (annotation). | string | | no |
| vm_ssh_user_name | VM ssh user name. | string | | yes |
| vm_ssh_user_password | VM ssh user name. | string | | yes |
| esxi_network_name | ESXI's network resource name attached to VM. Example: `VM Network`. | string | | yes |
| esxi_datastore_name | ESXI's datastore resource name to store VM files. Example: `datastore0`. | string | | yes |


## Otputs
None


## Usage

```terraform

terraform {
    required_version = ">= 0.13"
    required_providers {
        esxi = {
            source = "registry.terraform.io/josenk/esxi"
        }
    }
}


provider "esxi" {
    esxi_hostssl = var.esxi_host_sslport
    esxi_hostname = var.esxi_host_address
    esxi_hostport = var.esxi_host_port
    esxi_username = var.esxi_user_name
    esxi_password = var.esxi_user_password
}


variable "esxi_host_sslport" {
    description = "ESXI host's ssl port."
    type = string
    default = "443"
}

variable "esxi_host_address" {
    description = "ESXI host's address."
    type = string
}

variable "esxi_host_port" {
    description = "ESXI host's ssh port."
    type = string
}

variable "esxi_user_name" {
    description = "ESXI host's ssh user name."
    type = string
}

variable "esxi_user_password" {
    description = "ESXI host's ssh user password."
    type = string
}


module "esxi-vm" {
    source = "github.com/vfabi/terraform-module-esxi-vm?ref=1.1"
    count = 2

    # Provider explicit definition (optional).
    providers = {
        esxi = esxi
    }

    vm_name_base = "myvm"  # optional, default="vm"
    vm_name_postfix = count.index
    vm_os_type = "centos7-64"
    vm_spec_memory = "768"  # optional, default="512"
    vm_spec_cpu_cores = "1"  # optional, default="1"
    vm_image_template_file = "/localhost/my/path/centos7-minimal.cloud-init.x86_64.ova"
    vm_poweron = "on"  # optional, default=on
    vm_ssh_user_name = "user"
    vm_ssh_user_password = "Yua89_26gHa_eYu7q"
    vm_notes = "some vm notes"
    esxi_network_name = "VM Network"
    esxi_datastore_name = "datastore0"
}

```


## Contributing
Please refer to each project's style and contribution guidelines for submitting patches and additions. In general, we follow the "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull request** so that we can review your changes

NOTE: Be sure to merge the latest from "upstream" before making a pull request!


## License
Apache 2.0
