variable "cidr_block" {
  type        = string
  description = "Networkng CIDR block to be use for the VPC"
}

variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "tags" {
  type        = map(any)
  description = "Tags adionadas em todos os recursos do projeto"
}