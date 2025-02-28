variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "tags" {
  type        = map(any)
  description = "Tags adionadas em todos os recursos do projeto"
}

variable "public-subnet-1a" {
  type        = string
  description = "Subnet publica AZ 1a"
}

variable "public-subnet-1b" {
  type        = string
  description = "Subnet publica AZ 1b"
}