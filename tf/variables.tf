variable "rg-location"{
  default= "westus2"
}

variable "tf-vpc-address" {
  type= list
  default= ["10.1.0.0/16"]
}

variable "tf-subnet-address"{
  type= list
  default= ["10.1.0.0/24"]
}

variable "tf-sg-var"{
  type= list(object({
    name= string
    direction= string
    access= string 
    destination_port_range=number
  }))
  default= [
   {
     name= "SSH"
     direction= "Inbound"
     access= "Allow"
     destination_port_range= "22"
    }]
}
