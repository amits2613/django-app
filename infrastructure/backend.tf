terraform {
  backend "s3" {
    bucket = "django-test-amit"
    key    = "django-state-file.tfstate"
  }
}
