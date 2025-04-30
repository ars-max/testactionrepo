#create a new security group
resource "aws_security_group" "securitygroup" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id
  tags        = var.tags
}

resource "aws_security_group_rule" "ingress_rules" {
  for_each = merge(
    { for idx, rule in var.security_group_config.ingress_rules_cidr_blocks : "cidr_${idx}" => rule },
    { for idx, rule in var.security_group_config.ingress_rules_security_group : "sg_${idx}" => rule }
  )

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  description       = each.value.description
  security_group_id = aws_security_group.securitygroup.id

  # Conditional assignment: If `cidr_blocks` exist, use it; otherwise, use `source_security_group_id`
  cidr_blocks              = lookup(each.value, "cidr_blocks", null)
  source_security_group_id = lookup(each.value, "source_security_group_id", null)
}


resource "aws_security_group_rule" "egress" {
  for_each = { for idx, rule in var.security_group_config.egress_rules : idx => rule }

  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.securitygroup.id
  depends_on        = [aws_security_group.securitygroup]
}
