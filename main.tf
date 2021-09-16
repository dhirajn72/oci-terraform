provider "oci" {}

resource "oci_core_instance" "generated_oci_core_instance" {
	agent_config {
		is_management_disabled = var.is_management_disabled
		is_monitoring_disabled = var.is_monitoring_disabled  
		plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
	}
	availability_config {
		recovery_action =var.recovery_action
	}
	availability_domain =var.availability_domain
	compartment_id = var.compartment_id
	create_vnic_details {
		assign_public_ip = "true"
		subnet_id =var.subnet_id
	}
	display_name = "ubuntu20.04"
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	metadata = {
		"ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFUI18n3w75XIenvQem2vj9hlEyBGVyzSK52nvFE91ymnfjFhVaeftjKSNpZiFZj5ST3Zri8psal4k6XQV53G6yz1hDG1sr44f4tAJEkgMSmZoP2vr99ijD8OIwBMSvBXcvWfs/mduCAI/5LzMY+PZWwK3oMdtaxJbz8nhLeJxeDK2SEn+K7A9lGkrEPHi7xl2vTWdvZSY4i1g8GQvGTGRLkNrG7Igmq916wi0SJHi0do5qCU5fl1lKV1EvCI66sCtST2W6p+QYxu2MDkDOsvF/jZh8jYLjAnkakFjk6b5B3e0QnzccxIYuov2OarQbFyqTdhu1MUJ/vrh78afHIrsDWHm7HeaB+61Li90LVhGZn3gpWm9ZA/EYHgPfH3IDJ/90iqNkC3BxojxByDz+ktr2JgW6OiYQuZzzLrIRoyjCrk8TfI457Bf78LT23AF7S3XTrJ+H6wQ4CVtCsptjU2u+jsau8dfGlP9i+0/dYEYkMmNqEirNcAHcjZS44Asz7U= dhiraj@dhiraj-mac"
	}
	shape =var.shape
	source_details {
		source_id = var.ubuntu_source_id
		source_type = "image"
	}
}


variable "recovery_action"{}
variable "is_management_disabled" {}
variable "is_monitoring_disabled" {} 
variable "availability_domain" {}
variable "compartment_id" {} 
variable "subnet_id" {}
variable "display_name" {} 
variable "shape" {}
variable "source_id" {} 
variable "ubuntu_source_id"{}
