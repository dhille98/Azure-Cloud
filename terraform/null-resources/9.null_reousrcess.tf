resource "null_resource" "testvm1" {
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
      type     = "ssh"
      user     = "adminsree"
      password = data.azurerm_key_vault_secret.testvm1.value
      host     = azurerm_public_ip.testvm_pip1.ip_address
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
    connection {
      type     = "ssh"
      user     = "adminsree"
      password = data.azurerm_key_vault_secret.testvm1.value
      host     = azurerm_public_ip.testvm_pip1.ip_address
    }
  }
  #This resouce will be recreated if there is a changein tag version.
  triggers = {
    public-servers-tags = azurerm_linux_virtual_machine.vm.tags.Version
  }
}