variable "vpc" {
  description = "the vpc name"
}

variable "vpc_id" {
  description = "the vpc id"
}

variable "subnets" {
  description = "the subnets"
}

variable "private_zone_id" {
  description = "the r53 private zone id"
}

variable "cluster_id" {
  description = "the cluster_id"
}

variable "name" {
  description = "the microservice name"
}

variable "image" {
  description = "the docker container image to use"
}

variable "port" {
  description = "the microservice port"
}

variable "desired_count" {
  description = "the zone_id to use"
}
