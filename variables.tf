variable "name" {}

variable "rg" {
  type = object({
    name     = string
    location = string
    id       = string
  })
}

variable "identity_id" {
  default = null
}

variable "scopes" {
  type = map(object({
    scope     = string
    role_name = string
  }))
  default = {}
}

variable "audience" {
  type    = set(string)
  default = ["api://AzureADTokenExchange"]
}

variable "issuer" {}

variable "subject" {}

