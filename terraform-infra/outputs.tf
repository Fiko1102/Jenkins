
output "web-address_jenkins" {
  value = aws_instance.jenkins_docker.public_ip
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "ubuntu_arn" {
  value = data.aws_ami.ubuntu_ami.arn
}
output "ubuntu_image_id" {
  value = data.aws_ami.ubuntu_ami.id
}

resource "local_file" "ansible-hosts" {
  filename = "../ansible/hosts"
  content = templatefile("./templates/ansible-hosts.tftpl", {
    public_ip = aws_instance.jenkins_docker.public_ip
  })

}
