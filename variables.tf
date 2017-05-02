variable "vpc" {
  description = "the vpc name"
}

variable "vpc_id" {
  description = "the vpc id"
}

variable "region" {
  description = "the region"
}

# variable "subnets" {
#   description = "the subnets"
# }

# variable "private_zone_id" {
#   description = "the r53 private zone id"
# }

variable "cluster_id" {
  description = "the cluster_id"
}

# variable "microservice_elb_security_group_id" {
#   description = "the elb security group to use id"
# }

variable "alb_id" {
  description = "the alb to use id"
}

variable "alb_arn" {
  description = "the alb to use arn"
}

variable "name" {
  description = "the microservice name"
}

variable "version" {
  description = "the microservice version"
  default = "v1"
}

variable "image" {
  description = "the docker container image to use"
}

variable "container_port" {
  description = "the container port"
  default = 8080
}

variable "port" {
  description = "the microservice port"
}

variable "cpu" {
  description = "the number of cpu units to reserve"
  default = 10 
}

variable "memory" {
  description = "the number of MiB of memory to reserve"
  default = 50 
}

variable "desired_count" {
  description = "the number of microservices to provision"
}

variable "internal" {
  description = "is the microservice internal only"
  default = false
}

variable "acm_certificate_arn" {
  description = "the ARN of the aws certificate manager certificate to use"
  default = ""
}
