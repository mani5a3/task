module "test-targetgroup" {
  source = "../../modules/target-groups"
  target_group_name = "Test-TG"
  target_group_port = "80"
  target_type = "instance"
  target_group_path  = "/"
  target_group_protocol            = "HTTP"
  target_group_healthy_threshold   = 2
  target_group_unhealthy_threshold = 2
  timeout             = 5
  interval            = 30
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = module.test-targetgroup.targetgroup-arn
  target_id        = module.test-app-server.instanceid
  port             = 80
}
