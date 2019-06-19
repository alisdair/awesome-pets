variable "number_of_pets" {
  type = number
  default = 5
}

resource "random_pet" "pet" {
  count = var.number_of_pets
  length = 3
}

output "pet_names" {
  value = [random_pet.pet.*.id]
}
