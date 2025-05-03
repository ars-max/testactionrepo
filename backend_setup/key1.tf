resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "Key1" # Name of the key pair in AWS
  public_key = tls_private_key.ec2_key.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.ec2_key.private_key_pem
  filename = "Key1" # Name of the file to save the private key
  file_permission = "0600"
}

output "key_name" {
  value = aws_key_pair.ec2_key_pair.key_name
}

output "private_key_path" {
  value     = local_file.private_key.filename
  sensitive = true
}
