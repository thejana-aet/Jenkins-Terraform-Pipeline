
resource "aws_instance" "ec2_instance1" {
  ami                         = "ami-0b6c6ebed2801a5cb"
  instance_type               = "t3.micro"
#   subnet_id                   = aws_subnet.public_subnet.id
#   vpc_security_group_ids      = [aws_security_group.public_sg.id]
  associate_public_ip_address = true
  key_name                    = "aws_key_test"

  tags = {
    Name = "thejana-public-instance-secondary"
  }
}  