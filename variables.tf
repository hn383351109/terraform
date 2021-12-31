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

variable "ssh_key" {
  description = "a master ssh key"
  default = {
    "key_name" = "key_name"
    "public_key" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
  }
}


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
    "image-i" = "ami-005e54dee72cc1d00" 
  }
}

variable "image_type" {
  description = "Image type for all"
  default = {
    "t2-micro" = "t2.micro" 
  }
}
