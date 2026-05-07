resource "aws_security_group" "grafana_sg" {
  name        = "GrafanaSG"
  description = "Allow access from my home"
  vpc_id      = "vpc-060d4d3da00079625"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "efs_grafana_sg" {
  name        = "efs-grafana"
  description = "allowc ecs access to efs"
  vpc_id      = "vpc-060d4d3da00079625"

  ingress {
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [aws_security_group.grafana_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
