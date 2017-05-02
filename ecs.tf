resource "aws_ecs_task_definition" "microservice" {
  family = "${var.vpc}-${var.name}-${var.version}"
  container_definitions = <<EOF
[
  {
    "name": "${var.vpc}-${var.name}-${var.version}",
    "image": "${var.image}",
    "cpu": ${var.cpu},
    "memory": ${var.memory},
    "portMappings": [{
      "containerPort": ${var.container_port},
      "hostPort": 0
    }],
    "environment": [{
      "name" : "LOG_GROUP_NAME",
      "value" : "${aws_cloudwatch_log_group.microservice.name}"
    }]
  }
]
EOF
}

resource "aws_ecs_service" "microservice" {
  name = "${var.vpc}-${var.name}-${var.version}"
  cluster = "${var.cluster_id}"
  task_definition = "${aws_ecs_task_definition.microservice.arn}"
  desired_count = "${var.desired_count}"
  iam_role = "${aws_iam_role.server_role.arn}"
  depends_on = ["aws_iam_role_policy.server_policy"]

  load_balancer {
    target_group_arn = "${aws_alb_target_group.microservice.arn}"
    container_name = "${var.vpc}-${var.name}-${var.version}"
    container_port = "${var.container_port}"
  }
}

resource "aws_alb_listener" "microservice" {
  load_balancer_arn = "${var.alb_arn}"
  port              = "80"
  protocol          = "HTTP"
  # ssl_policy        = "ELBSecurityPolicy-2015-05"
  # certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    target_group_arn = "${aws_alb_target_group.microservice.arn}"
    type             = "forward"
  }
}


resource "aws_alb_target_group" "microservice" {
  name = "${var.vpc}-${var.name}-${var.version}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"

  health_check {
    path = "/healthz"
  }
}



