resource "aws_security_group" "allow_web" {
  name        = "allow_wev"
  description = "SG for Jenkins in Docker"
  vpc_id      = data.aws_vpc.default.id
  ingress {
    from_port   = 22
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #Here you can wrire only one ip address for you and who works with you
  }
  egress {
    from_port   = 22
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "jenkins_allow_web"
  }
}
