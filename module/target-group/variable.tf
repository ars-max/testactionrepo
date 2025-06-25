# Target Group Name
variable "name" {
  description = "Name of the target group"
  type        = string
}

# Port for Target Group
variable "target_group_port" {
  description = "Port on which targets receive traffic"
  type        = number
}

# Protocol for Target Group
variable "target_group_protocol" {
  description = "Protocol for routing traffic to the targets (e.g., HTTP or HTTPS)"
  type        = string
}

# VPC ID
variable "vpc_id" {
  description = "ID of the VPC for the target group"
  type        = string
}


variable "target_type" {
  type = string
}


variable "tags" {
  type = map(string)
}


