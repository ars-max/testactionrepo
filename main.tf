# EC2 instance module
module "ec2-instances" {
  source = "./module/ec2-instances"
  for_each = { for instance in var.ec2_instance_configuration.ec2_instance_details : instance.name => instance }

  name                                     = each.key
  ami                                      = each.value.ami
  instance_type                            = each.value.instance_type
  volume_size                              = each.value.volume_size
  volume_type                              = each.value.volume_type
  availability_zone                        = each.value.availability_zone
  subnet_ids                               = each.value.subnet_ids
  vpc_security_group_ids                   = each.value.vpc_security_group_ids
  delete_on_termination                    = each.value.delete_on_termination
  disable_api_termination                = each.value.disable_api_termination
  instance_initiated_shutdown_behavior = each.value.instance_initiated_shutdown_behavior
  monitoring                               = each.value.monitoring
  associate_public_ip_address              = each.value.associate_public_ip_address
  encrypted                                = each.value.encrypted
  key_name                                 = each.value.key_name
  tags                                     = each.value.tags
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-vpc"
  }
}

module "Sg_grp" {
  source = "./module/Sg_grp"

  for_each = { for sg in var.security_group_configurations : sg.Name => sg }

  vpc_id              = each.value.vpc_id
  ingress_from_port   = each.value.ingress_from_port
  ingress_to_port     = each.value.ingress_to_port
  ingress_protocol    = each.value.ingress_protocol
  ingress_cidr_blocks = each.value.ingress_cidr_blocks
  egress_from_port    = each.value.egress_from_port
  egress_to_port      = each.value.egress_to_port
  egress_protocol     = each.value.egress_protocol
  egress_cidr_blocks  = each.value.egress_cidr_blocks
  tags                = each.value.tags
}
