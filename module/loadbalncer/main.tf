# Create Application Load Balancer
resource "aws_lb" "alb" {
  name                       = var.name
  internal                   = var.internal
  load_balancer_type         = var.load_balancer_type
  security_groups            = var.security_group_ids
  subnets                    = var.subnet_ids
  ip_address_type            = var.ip_address_type
  idle_timeout               = var.idle_timeout
  enable_http2               = var.enable_http2
  enable_deletion_protection = var.enable_deletion_protection
  tags                       = var.tags
}
