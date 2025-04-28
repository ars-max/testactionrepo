variable "region" {
  description = "The AWS region to create resources in "
  type        = string
  default     = "us-east-1"
}


#instance variables
variable "ec2_instance_configuration" {
  type = object({
    ec2_instance_details = list(object({
      instance_type                        = string
      ami                                  = string
      delete_on_termination                = bool
      disable_api_termination              = bool
      instance_initiated_shutdown_behavior = string
      monitoring                           = bool
      volume_size                          = number
      volume_type                          = string
      vpc_security_group_ids               = list(string)
      associate_public_ip_address          = bool
      encrypted                            = bool
      key_name                             = string
      name                                 = string
      availability_zone                    = string
      subnet_ids                           = string
      tags                                 = map(string)
    }))
  })
  default = {
    ec2_instance_details = []
  }
}
# Security Group variables
variable "security_group_configuration" {
  type = object({
    security_group_details = list(object({
      sg_name                = string
      sg_description         = string
      vpc_id                 = string
      ingress_from_port      = number
      ingress_to_port        = number
      ingress_protocol       = string
      ingress_cidr_blocks    = list(string)
      egress_from_port       = number
      egress_to_port         = number
      egress_protocol        = string
      egress_cidr_blocks     = list(string)
      tags                   = map(string)
    }))
  })
  default = {
    security_group_details = []
  }
}
