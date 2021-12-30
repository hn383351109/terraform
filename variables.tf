variable "aws_region" {
  description =  "The name of the region"
}

variable "vpc_name" {
  description = "The name of the VPC"
}

variable "cidr_numeral" {
  description = "The VPC CIDR numeral (10.x.0.0/16)"
}

variable "cidr_name_public" {
  default = {
    "0" = "0"
    "1" = "1"
    "2" = "2"
  }
}

variable "cidr_name_private" {
  default = {
    "0" = "3"
    "1" = "4"
    "2" = "5"
  }
}

variable "availability_zones" {
  description = "A comma-delimited list of availability zones for the VPC"
}

#variable "ssh_key_name" {
#  description = "a master ssh key"
#}


variable "server_port" {
  description = "Security_group from port"
  default = {
    "0" = "22"
    "1" = "443"
  }
}
