// private record for microservice to microservice communications
# resource "aws_route53_record" "microservice" {
#   zone_id = "${var.private_zone_id}"
#   name = "${var.version}.${var.name}.api" 
#   type = "A"

#   alias {
#     name = "${aws_elb.microservice.dns_name}"
#     zone_id = "${aws_elb.microservice.zone_id}"
#     evaluate_target_health = "false" /* not allowed in private zones */
#   }
# }

