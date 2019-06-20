variable "number" {
  type = number
  default = 5
}

resource "random_pet" "pet" {
  count = var.number
  length = 3
}

output "pet_names" {
  value = [random_pet.pet.*.id]
}

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "alisdair-free"

    workspaces {
      name = "awesome-pets"
    }
  }
}
