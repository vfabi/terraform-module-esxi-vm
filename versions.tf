terraform {
    required_version = ">= 0.13.5"

    required_providers {
        esxi = {
            source = "registry.terraform.io/josenk/esxi"
            version = "~> 1.8.1"
        }
        template = "~> 2.2.0"
    }
}
