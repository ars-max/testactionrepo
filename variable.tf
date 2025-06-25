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
variable "lb_configuration" {
  description = "Configuration details for Load Balancers."
  type = object({
    lb_details = list(object({
      name                       = string
      security_group_ids         = list(string)
      subnet_ids                 = list(string)
      load_balancer_type         = string
      ip_address_type            = string
      idle_timeout               = number
      internal                   = bool
      enable_http2               = bool
      enable_deletion_protection = bool
      tags = object({
        Owner            = string
        preserve_c7n_gc  = string
      })
    }))
  })
}
#tg variable declaration
variable "tg_configuration" {
  description = "Configuration details for Target Groups."
  type = object({
    tg_details = list(object({
      name                  = string
      target_group_port     = number
      target_group_protocol = string
      vpc_id                = string
      target_type           = string
      stickiness_enabled    = bool
      tags = object({
        Owner = string
      })
      # THESE are the attributes made optional within the object type
      health_check_enabled  = optional(bool)
      health_check_interval = optional(number)
      health_check_path     = optional(string)
      health_check_protocol = optional(string)
      health_check_timeout  = optional(number)
      healthy_threshold     = optional(number)
      unhealthy_threshold   = optional(number)
      slow_start_duration   = optional(number) # Corrected typo if needed
      stickiness_type       = optional(string)
      cookie_duration       = optional(number)
      cookie_name           = optional(string)
      successCode_matcher   = optional(string)
      lambda_multi_value_headers_enabled = optional(bool)
      proxy_protocol_v2     = optional(bool)
    }))
  })
}
