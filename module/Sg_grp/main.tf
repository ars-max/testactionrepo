# Create Security Group
resource "aws_security_group" "create_sg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  # Ingress rules
  ingress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.ingress_cidr_blocks
  }

  # Egress rules
  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }

  tags = merge(var.tags, { Name = var.sg_name })
}
