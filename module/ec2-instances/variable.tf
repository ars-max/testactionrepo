variable "ami" {
  description = "A AMI which you want to create an instance."
  type        = string
}

variable "instance_type" {
  description = "Input the which type of the instance need to be created."
  type        = string
}

variable "availability_zone" {
  description = "provide availability zones "
  type        = string
}


variable "subnet_ids" {
  type = string
}

variable "instance_initiated_shutdown_behavior" {
  type = string
}

variable "disable_api_termination" {
  type = bool
}

variable "monitoring" {
  type = bool
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "name" {
  type = string
}
/*
variable "network_interface" {
  type = string
}*/

variable "volume_type" {
  type = string
}

variable "volume_size" {
  type = number
}

variable "delete_on_termination" {
  type = bool
}


variable "associate_public_ip_address" {
  description = "associate public ip address"
  type        = bool
}

variable "encrypted" {
  description = "EBS encryption"
  type        = bool
}

variable "key_name" {
  description = "Add key pair (public and private key)"
  type        = string
}
variable "tags" {
  type = map(string)
}

