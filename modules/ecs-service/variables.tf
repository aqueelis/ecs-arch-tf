variable "service_name" {
  type = string
}

variable "cluster_id" {
  type = string
}

variable "task_execution_role_arn" {
  type = string
}

variable "task_role_arn" {
  type = string
}

variable "container_name" {
  type = string
}

variable "container_image" {
  type = string
}


variable "container_port" {
  type = number
  default = 5000
}

variable "cpu" {
  type    = number
  default = 256
}

variable "memory" {
  type    = number
  default = 256
}

variable "desired_count" {
  type    = number
}

variable "target_group_arn" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
