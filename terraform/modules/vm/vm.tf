resource "azurerm_network_interface" "test" {
  name                = "project-3-NIC"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip
  }
}


# resource "azurerm_linux_virtual_machine" "test-vm" {
#   name                = var.name
#   location            = var.location
#   resource_group_name = var.resource_group
#   size                = "Standard_B2s"
#   admin_username      = var.admin_username
#   network_interface_ids = [azurerm_network_interface.test.id]
#   disable_password_authentication = true
#   admin_ssh_key {
#     username   = "user-ssh"
#     public_key = file("tf.pub")
#   }
#   os_disk {
#     caching           = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }
#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "18.04-LTS"
#     version   = "latest"
#   }
# }

# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "azurerm_linux_virtual_machine" "my_terraform_vm" {
  name                  = "myVM-3"
  location              = var.location
  resource_group_name   = var.resource_group
  network_interface_ids = [azurerm_network_interface.test.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "myvm"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.example_ssh.public_key_openssh
  }

}

