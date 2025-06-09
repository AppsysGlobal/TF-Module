terraform {
  required_version = ">= 0.12.6"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.0.0"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

module "instance" {
  source                     = "oracle-terraform-modules/compute-instance/oci"
  instance_count             = 1
  ad_number                  = 1
  compartment_ocid           = var.compartment_ocid
  instance_display_name      = var.instance_display_name
  source_ocid                = var.source_ocid
  subnet_ocids               = [var.subnet_ocid] # changed to list
  public_ip                  = var.public_ip
  ssh_public_keys = [file(var.ssh_public_key_path)]
  shape                      = var.shape
  block_storage_sizes_in_gbs = [50]
}
