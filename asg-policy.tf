resource "aws_autoscaling_policy" "tf-scaling-policy" {
  name                   = "tf-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.asg-exercise3.name
}

resource "aws_cloudwatch_metric_alarm" "tf-alarm-policy" {
  alarm_name          = "cpu40"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "40"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg-exercise3.name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.tf-scaling-policy.arn]
}