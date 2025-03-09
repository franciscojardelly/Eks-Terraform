variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "tags" {
  type        = map(any)
  description = "Tags adionadas em todos os recursos do projeto"
}

variable "oidc" {
  type        = string
  description = "OIDC provider cluster"

}

variable "cluster_name" {
  type        = string
  description = "Name do cluster"
}