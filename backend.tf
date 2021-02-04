# terraform {
#   backend "s3" {
#     bucket = "jcde-exercise3"
#     key = "terraform/exercise3/tfstate"
#     region = "ap-southeast-1"
#   }
# }

terraform {
  backend "s3" {
    bucket = "jcde-terraform-state01"
    key    = "terraform/exercise/tfstate"
    region = "ap-southeast-1"
  }
}
