
## The 'launch configuration' needs to be defined
resource "aws_launch_configuration" "k8s_demo_launch_config" {
  name            = "k8s_demo_launch_config"
  image_id        = data.aws_ami.amazon_linux_2.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.k8s_demo_security_group.id}"]
  key_name        = aws_key_pair.fortune_keypair.key_name
  user_data       = file("./config/scripts/bootstrap_k8s_install.sh")
}

## The autoscaling group needs to be defined
resource "aws_autoscaling_group" "k8s_demo_group_autoscale" {
  name                      = "k8s_demo_group_autoscale"
  vpc_zone_identifier       = [aws_subnet.k8s_demo_subnet_public_1.id]
  launch_configuration      = aws_launch_configuration.k8s_demo_launch_config.name
  min_size                  = 1
  max_size                  = 1
  desired_capacity          = 1
  health_check_grace_period = 100
  health_check_type         = "EC2"
  force_delete              = true
  tag {
    key                 = "Name"
    value               = "k8s_demo_web_server"
    propagate_at_launch = true
  }
  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }
}

/*
The policy for the autoscaling group needs to be defined
If the CPU gets below a certain threshold, the policy takes effect
*/
resource "aws_autoscaling_policy" "cpu_overuse_policy_scaleup" {
  name                   = "cpu_overuse_policy_scaleup"
  autoscaling_group_name = aws_autoscaling_group.k8s_demo_group_autoscale.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  cooldown               = 300
  policy_type            = "SimpleScaling"
  tags = {
    name = "k8s_demo"
  }
}


/*
The policy for the autoscaling group needs to be defined
If the CPU gets above a certain threshold, the policy takes effect
*/
resource "aws_autoscaling_policy" "cpu_overuse_policy_scaledown" {
  name                   = "cpu_overuse_policy_scaledown"
  autoscaling_group_name = aws_autoscaling_group.k8s_demo_group_autoscale.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = _1
  cooldown               = 60
  policy_type            = "SimpleScaling"
  tags = {
    name = "k8s_demo"
  }
}
