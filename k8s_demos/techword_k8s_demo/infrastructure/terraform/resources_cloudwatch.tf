
## A CloudWatch metric will be created for CPU usage to scale up
resource "aws_cloudwatch_metric_alarm" "cpu_overuse_alarm_scaleup" {
  depends_on = [
    aws_autoscaling_group.k8s_demo_group_autoscale,
    aws_autoscaling_policy.cpu_overuse_policy_scaleup
  ]
  alarm_name          = "cpu_overuse_alarm_scaleup"
  alarm_description   = "Alarm when CPU use reaches critical rate"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  actions_enabled     = true
  alarm_actions       = [aws_autoscaling_policy.cpu_overuse_policy_scaleup.arn]
  dimensions = {
    "AutoScalingGroupName" : aws_autoscaling_group.k8s_demo_group_autoscale.name
  }
  tags = {
    name = "k8s_demo"
  }
}

## A CloudWatch metric will be created for CPU usage to scale down
resource "aws_cloudwatch_metric_alarm" "cpu_overuse_alarm_scaledown" {
  depends_on = [
    aws_autoscaling_group.k8s_demo_group_autoscale,
    aws_autoscaling_policy.cpu_overuse_policy_scaledown
  ]
  alarm_name          = "cpu_overuse_alarm_scaledown"
  alarm_description   = "Alarm when CPU usage lowers"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "15"
  actions_enabled     = true
  alarm_actions       = [aws_autoscaling_policy.cpu_overuse_policy_scaledown.arn]
  dimensions = {
    "AutoScalingGroupName" : aws_autoscaling_group.k8s_demo_group_autoscale.name
  }
  tags = {
    name = "k8s_demo"
  }
}