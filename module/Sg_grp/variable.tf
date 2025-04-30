variable "name" {
  description = "Name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "tags" {
  description = "Tags for the security group"
  type        = map(string)
}

variable "description" {
  description = "Description of the security group"
  type        = string
}

variable "security_group_config" {
  description = "Configuration for the security group, including ingress and egress rules"
  type = object({
    ingress_rules_cidr_blocks = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      description = string
    }))
    ingress_rules_security_group = list(object({
      from_port                = number
      to_port                  = number
      protocol                 = string
      source_security_group_id = string
      description              = string
    }))
    egress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      description = optional(string, "Allow egress traffic") # Optional with default
    }))
  })
}
