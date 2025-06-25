#target groups
resource "aws_lb_target_group" "alb_target_group" {
  name                               = var.name
  port                               = var.target_group_port
  protocol                           = var.target_group_protocol
  vpc_id                             = var.vpc_id
  target_type                        = var.target_type
  tags                               = var.tags
}
