# Azure GUIDS
variable "subscription_id" {
    default = "7cb082a6-6105-42a2-a09c-90c88cc9a56d"
}
variable "client_id" {
    default = "6f9f1371-0ee3-4920-bbd7-7a8eaba9c560" 
}
variable "client_secret" {
    default = "0yt8Q~lka45H-h7z9wj-SzYtD10BX1cpwls_fbt~" 
}
variable "tenant_id" {
    default = "967e3a23-9001-43c7-8acb-674f04ae8835"
}

# Resource Group/Location
variable location {
    default = "eastus"
}
variable "resource_group" {
    default = "autotest"
}
variable "application_type" {
    default = "automate-app-test-azure-project"
}
variable "name" {
    default = "vm-test-automation"
}
variable "admin_username" {
  default = "azureuser"
}
# variable "public_key" {}
# variable "public_key_path" {
#     description = "Full path incl. filename to the public key."
#     default = "tf.pub"
# }
# Network
variable virtual_network_name {}
variable address_prefix_test {}
variable address_space {}

