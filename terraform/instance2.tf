resource "aws_instance" "projeto3_2" {
  ami           = "ami-0ac019f4fcb7cb7e6"
  instance_type = "t2.micro"

  #private_key = "${file("${path.module}/projeto3.pem")}"
  key_name = "projeto-pipeline"

  #key_name = "${var.private_key_path)}"
  #key_name = "${aws_key_pair.mykeypair.key_name}"
  subnet_id                   = aws_subnet.main-public-2.id
  vpc_security_group_ids      = [aws_security_group.allow-ssh.id]
  associate_public_ip_address = "true"

  #aws_security_group = "sg-0b70b9d3a1ae3add6"

  user_data = file("${path.module}/user_data.sh")
  tags = var.default_tags
}

output "aws_ip_2" {
  value = aws_instance.projeto3_2.public_ip
}

output "aws_dns_2" {
  value = aws_instance.projeto3_2.public_dns
}
