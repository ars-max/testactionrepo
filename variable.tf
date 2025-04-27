variable "region" {
  description = "The AWS region to create resources in "
  type        = string
  default     = "ap-southeast-2"
}

#AWS account configuration
variable "aws_configurations" {
  description = <<-EOT
  EOT

  type = object({
    account_id   = string
    aws_region   = string
    assumed_role = optional(string, "nct-iac-cicd-sa-role")
  })
}

variable "provider_tags" {
  description = "default tags for provider"
  type        = map(string)
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
      iam_instance_profile                 = string
      tags                                 = map(string)
    }))
  })
  default = {
    ec2_instance_details = []
  }
}
