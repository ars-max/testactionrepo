variable "region" {
  description = "The AWS region to create resources in "
  type        = string
  default     = "us-east-1"
}

# Instance variables
variable "ec2_instance_configuration" {
  type = object({
    ec2_instance_details = list(object({
      instance_type                            = string
      ami                                      = string
      delete_on_termination                    = bool
      disable_api_termination                = bool
      instance_initiated_shutdown_behavior = string
      monitoring                               = bool
      volume_size                              = number
      volume_type                              = string
      vpc_security_group_ids                   = list(string)
      associate_public_ip_address              = bool
      encrypted                                = bool
      key_name                                 = string
      name                                     = string
      availability_zone                        = string
      subnet_ids                               = string
      tags                                     = map(string)
    }))
  })
  default = {
    ec2_instance_details = []
  }
}
#Security group variables
variable "security_group_config" {
  description = "Configuration for the security group"
  type = list(object({
    name        = string
    description = string
    vpc_id      = string
    ingress_rules_cidr_blocks = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      description = string
    }))
    egress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = number
      cidr_blocks = list(string)
      description = string
    }))
    tags = map(string)
  }))
}
