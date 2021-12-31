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

#variable "ssh_key" {
#  description = "a master ssh key"
#  default = {
#    "key_name" = "sim-test"
#  }
#}

variable "server_port" {
  description = "Security_group from port"
  default = {
    "22" = "22"
    "443" = "443"
    "80" = "80"
  }
}

variable "asg_image_ami" {
  description = "ASG Image"
  default = {
    "image-asg" = "ami-005e54dee72cc1d00" 
  }
}

variable "instance_image_ami" {
  description = "Instance Image"
  default = {
    "image-i" = "ami-0ed9277fb7eb570c9" 
  }
}

variable "image_type" {
  description = "Image type for all"
  default = {
    "t2-micro" = "t2.micro" 
    "t3-micro" = "t3.micro" 
  }
}
