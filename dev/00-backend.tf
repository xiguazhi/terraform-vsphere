terraform {
    backend "s3" {
        region = "us-west-2"
        access_key = var.access_key
        secret_key = var.secret_key
        bucket = "bs-autocount-upload"
        key = var.s3_folder
    }
}