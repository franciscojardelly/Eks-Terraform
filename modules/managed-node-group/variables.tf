variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "tags" {
  type        = map(any)
  description = "Tags adionadas em todos os recursos do projeto"
}

variable "cluster_name" {
  type        = string
  description = "Node group EKS cluster"
}

variable "subnet_private_1a" {
  type        = string
  description = "Subnetes privadas para o nodegroup"
}

variable "subnet_private_1b" {
  type        = string
  description = "Subnetes privadas para o nodegroup"
}