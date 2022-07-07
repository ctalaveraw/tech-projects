## SSH key pair for the instance will be created to SSH for running bootstrap
resource "aws_key_pair" "k8s_demo_keypair" {
  key_name   = "k8s_demo_keypair"
  public_key = file(var.aws_ssh_key_public_k8s_demo)

}

## Security Group will be needed to alllow SSH/HTTP/HTTPS
resource "aws_security_group" "k8s_demo_security_group" {
  name        = "k8s_demo_security_group"
  description = "Allow SSH/HTTP/HTTPS"
  vpc_id      = aws_vpc.k8s_demo_vpc.id
  ingress { # Allow SSH
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress { # Allow all ICMP for ping test
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress { # Allow HTTP
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress { # Allow 8080 for web server connection
    from_port   = 8080
    to_port     = 8080
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