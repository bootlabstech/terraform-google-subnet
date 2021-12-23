terraform {
  required_providers {
    google = {
      version = " ~>4.0.0"
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  region = "ap-south-1"
}