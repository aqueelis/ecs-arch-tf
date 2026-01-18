variable "repository_name" {
  type = string
}

variable "image_tag_mutability" {
  type = string
  default = "IMMUTABLE"
}

variable "scan_on_push" {
  type = bool
  default = false
}

variable "tags" {
  type = map(string)
  default = {}
}