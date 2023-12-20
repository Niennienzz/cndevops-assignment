variable "domain" {
  default = ""
}

variable "github_username" {
  default = ""
}

variable "github_personal_token" {
  default = ""
}

variable "region" {
  description = "The region where the instance will be created."
  default     = "ap-hongkong"
}

variable "secret_id" {
  default = "YOUR_SECRET_ID"
}

variable "secret_key" {
  default = "YOUR_SECRET_KEY"
}

variable "password" {
  default = "Password12345*"
}
