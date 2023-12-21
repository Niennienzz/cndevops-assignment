variable "secret_id" {
  default = "YOUR_SECRET_ID"
}

variable "secret_key" {
  default = "YOUR_SECRET_KEY"
}

variable "password" {
  default = "Password12345*"
}

variable "region" {
  description = "The region where the instance will be created."
  default     = "ap-hongkong"
}

variable "availability_zone" {
  description = "The availability zone where the instance will be created."
  default     = "ap-hongkong-2"
}

# Documentation of Tencent Cloud CVM instance charge type:
# https://www.tencentcloud.com/document/product/213/17816
# https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/instance#instance_charge_type
variable "instance_charge_type" {
  type    = string
  default = "SPOTPAID"
}

variable "tags" {
  description = "A map of the tags to use for the resources that are deployed"
  type        = map(string)

  default = {
    web = "tf-web"
    dev = "tf-dev"
  }
}

variable "short_name" {
  default = "tf-vpc"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "web_cidr" {
  default = "10.0.1.0/24"
}

variable "image_id" {
  default = ""
}

variable "instance_name" {
  default = "terraform-cvm-k8s"
}

variable "cpu" {
  default = "4"
}

variable "memory" {
  default = "8"
}

variable "vpc_id" {
  default = ""
}

variable "subnet_id" {
  default = ""
}
