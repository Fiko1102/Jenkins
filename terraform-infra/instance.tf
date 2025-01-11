
resource "aws_instance" "jenkins_docker" {
  ami                    = data.aws_ami.ubuntu_ami.id # Ubuntu amd64 (x86_64)
  instance_type          = "c6a.large"
  vpc_security_group_ids = [aws_security_group.allow_web.id]
  key_name               = "key_for_jenkins" # Please use your key name
  iam_instance_profile   = aws_iam_instance_profile.role_for_jenkins.name
  root_block_device {
    volume_size = 40
    volume_type = "gp3"
  }
  tags = {
    Name = "Jenkins on the docker"
  }
}
