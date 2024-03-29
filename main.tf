variable "number" {
  type = number
  default = 5
}

resource "random_pet" "pet" {
  count = var.number
  length = 4
  lifecycle {
    precondition {
      condition = var.number > 10
      error_message = "Not enough pets."
    }
  }
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
