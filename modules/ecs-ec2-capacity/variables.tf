variable "cluster_name" {
  type = string
}

variable "instance_type" {
  type = string
  default = "t3.medium"
}

variable "desired_capacity" {
  type = number
  default = 2
}

variable "min_size" {
  type = number
  default = 1
}

variable "max_size" {
  type = number
  default = 4
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "iam_instance_profile" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}