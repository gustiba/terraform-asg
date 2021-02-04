resource "aws_autoscaling_schedule" "tf-policy-schedule" {
  scheduled_action_name  = "tf-policy-schedule"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 1
  start_time             = "2021-02-04T18:00:00Z"
  end_time               = "2021-02-04T03:00:00Z"
  autoscaling_group_name = aws_autoscaling_group.asg-exercise3.name
}