resource "aws_placement_group" "tf-asg-placement" {
  name     = "tf-asg-placement"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "asg-exercise3" {
  name                      = "tf-asg-exercise3"
  max_size                  = 3
  min_size                  = 1
  health_check_grace_period = 60
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  placement_group           = aws_placement_group.tf-asg-placement.id
  vpc_zone_identifier       = [aws_subnet.tv-public-1.id, aws_subnet.tv-public-2.id, aws_subnet.tv-public-3.id]

  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "Name"
    value               = "asg-exercise3"
    propagate_at_launch = true
  }

  launch_template {
  id      = aws_launch_template.templateApache.id
  version = "$Latest"
  }

}

