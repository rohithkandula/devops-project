resource "aws_ec2_instance" "my_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_subnet_ec2.id
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
}
