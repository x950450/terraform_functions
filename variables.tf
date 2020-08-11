// variable "avn"{
// type = string
// default = "avn1"
// }

variable "cidrs"{
type = list
default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
}

variable "env"{
type = string
default = "PROD"
}



variable "location"{
type = map
default = {

DEV = "West US"
PROD = "East US"
}
}