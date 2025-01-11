

resource "aws_iam_instance_profile" "role_for_jenkins" {
  name = "role_for_jenkins"
  role = aws_iam_role.jenkins_role.name
}

resource "aws_iam_role" "jenkins_role" {
  name = "jenkins_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = [
        "sts:AssumeRole",
        "sts:TagSession",
        "sts:SetSourceIdentity"
      ]
      Principal = {
        Service = "ec2.amazonaws.com",
      }
      Effect = "Allow"
    }]
  })
}
resource "aws_iam_role_policy" "role_for_jenkins" {
  name = "jenkins_role_devops_course_policy"
  role = aws_iam_role.jenkins_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "ec2:*"
        ],
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Action = [
          "s3:*"
        ],
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Action = [
          "iam:PassRole",
          "iam:ListRoles"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}
