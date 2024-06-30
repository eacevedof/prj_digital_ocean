terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {
    default = file(".env")
}

resource "digitalocean_ssh_key" "eduardoaf" {
  name       = "eduardoaf"
  public_key = file("id_rsa.pub")
}


# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

# sacado de: 
# https://github.com/pablokbs/peladonerd/blob/master/streaming/03-gitlab.tf/streaming/03-gitlab.tf
resource "digitalocean_droplet" "gitlab" {
  image     = "ubuntu-18-04-x64"
  name      = "gitlab-1"
  region    = "nyc1"
  size      = "s-2vcpu-4gb"
  user_data = "${file("userdata.yaml")}"
  ssh_keys  = ["${digitalocean_ssh_key.pelado.fingerprint}"]
}
