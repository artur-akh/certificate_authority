variable "region" {
  description = "Please enter region"
  type        = string
  default     = "eu-central-1"
}

variable "instance_type" {
  description = "Please enter instance_type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Please enter key_name"
  type        = string
}