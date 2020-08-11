provider "azurerm" {

  subscription_id = "c1bc2fcd-a809-4086-8763-1499cdf758fd"
  client_id       = "12ed31ee-69a1-4760-bae4-47f936df0e46"
  client_secret   = "GeD6fe~~-DW2.TkRibd34YrRj-cpqFr5g~"
  tenant_id       = "2ce08630-4008-4367-b437-0a1accfe0c8d"

  features {}
}



resource "azurerm_resource_group" "rg2" {
  name     = "rg2"
  location = "${lookup(var.location, var.env)}"
}

resource "azurerm_virtual_network" "avn" {
  name                = "avn1"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.rg2.location}"
  resource_group_name = "${azurerm_resource_group.rg2.name}"
}

resource "azurerm_subnet" "subnet1" {
 count = "${var.env =="PROD" ? 3 : 2}"
 #name = "subnet1"
  name                 = "subnet${count.index}"
  resource_group_name  = "${azurerm_resource_group.rg2.name}"
  virtual_network_name = "${azurerm_virtual_network.avn.name}"
  #address_prefix       = "${locals.cirds}"
  address_prefix       =  "${element(var.cidrs,count.index)}"
  
  #lookup and map can be used together with the below command
  #addresspredix = ${lookup(var.map, element(var.list, count.index))
  
}