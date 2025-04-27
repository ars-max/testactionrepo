#create instances
resource "aws_instance" "create_instance" {
  ami                                  = var.ami
  instance_type                        = var.instance_type
  availability_zone                    = var.availability_zone
  subnet_id                            = var.subnet_ids
  disable_api_termination              = var.disable_api_termination              # Termination Protection
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior # Shutdown Behaviour
  monitoring                           = var.monitoring                           # Cloudwatch Monitoring
  associate_public_ip_address          = var.associate_public_ip_address
  key_name                             = var.key_name
  iam_instance_profile                 = var.iam_instance_profile != "" ? var.iam_instance_profile : null
  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = var.delete_on_termination
    encrypted             = var.encrypted
  }
  
  vpc_security_group_ids = var.vpc_security_group_ids
}
