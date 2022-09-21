# Resource Group/Location
variable "location" {
  default = "eastus"
}
variable "resource_group" {
  default = "autotest"
}
variable "application_type" {
  default = "automate-app-test-azure-project"
}

variable "resource_type" {
  default = "AppService"
}
