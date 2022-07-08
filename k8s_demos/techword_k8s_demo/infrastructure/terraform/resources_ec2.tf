/*
This deploys an individual EC2 instance calling the Lambda function.

It will be commented out in favor of the ASG
*/


## A network interface will be created to attach to the EC2
resource "aws_network_interface" "k8s_demo_network_interface" {
  subnet_id   = aws_subnet.k8s_demo_subnet_public_1.id
  private_ips = ["10.0.0.69"]
  tags = {
    name = "k8s_demo"
  }
}

## An EC2 instance for the "k8s demo app will be created
resource "aws_instance" "k8s_demo_web_server" {
  # ami                         = data.aws_ami.amazon-linux-2.id
  ami                         = "ami-0b0ea68c435eb488d"
  availability_zone           = "us-east-1a"
  subnet_id                   = aws_subnet.k8s_demo_subnet_public_1.id
  vpc_security_group_ids      = ["${aws_security_group.k8s_demo_security_group.id}"]
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.k8s_demo_keypair.key_name
  tags = {
    name = "k8s_demo"
  }

  ## This reads the script that needs to be deployed to the EC2 instance
  provisioner "file" {
    source      = "./config/scripts/bootstrap_k8s_install.sh"
    destination = "/tmp/bootstrap_k8s_install.sh" # Copies script to /tmp/ directory
  }
  ## This executes the script remotely on the EC2 instance
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap_k8s_install.sh", # Makes the script executable
      "sudo /tmp/bootstrap_k8s_install.sh"      # Runs the script
    ]
  }
  connection {
    type        = "ssh"
    host        = coalesce(self.public_ip, self.private_ip)
    user        = var.instance_username
    private_key = file(pathexpand(var.aws_ssh_key_private_k8s_demo))
  }
}