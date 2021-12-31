#创建启动配置
resource "aws_launch_configuration" "hn-test" {
  name = "hn-test"
  image_id = "${var.asg_image_ami.image-asg}"
  instance_type = "${var.image_type.t2-micro}"
  security_groups = [aws_security_group.hn-test.id]
  key_name = aws_key_pair.hn-test.id
}

data "aws_vpc" "hn-test" {
  hn-test = true
}

data "aws_subnet_ids" "hn-test" {
  vpc_id = data.aws_vpc.hn-test.id
}

#创建置放组,进行物理节点模式设置
resource "aws_placement_group" "hn-test" {
  name     = "hn-test"
  strategy = "cluster"
}

#创建自动伸缩组
resource "aws_autoscaling_group" "hn-test" {
  name                      = "hn-test"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  placement_group           = aws_placement_group.hn-test.id
  launch_configuration      = aws_launch_configuration.hn-test.name
  vpc_zone_identifier       = ["${element(aws_subnet.private.*.id)}"]

  initial_lifecycle_hook {
    name                 = "hn-test"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 2000
    lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"

    notification_metadata = <<EOF
{
  "name": "hn-test"
}
EOF

    notification_target_arn = "arn:aws:sqs:us-east-1:444455556666:queue1*"
    role_arn                = "arn:aws:iam::123456789012:role/S3Access"
  }

  tag {
    key                 = "Name"
    value               = "hn-test"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "lorem"
    value               = "ipsum"
    propagate_at_launch = false
  }
}
