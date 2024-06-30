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
    # default = file(".env") error no se puede usar funciones en do_token
    default = ""
}

resource "digitalocean_ssh_key" "test_terraform" {
  name       = "test_terraform"
  public_key = file("~/.ssh/digocean-terraform.pub")
}


# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

# sacado de: 
# https://github.com/pablokbs/peladonerd/blob/master/streaming/03-gitlab.tf/streaming/03-gitlab.tf
resource "digitalocean_droplet" "dl_test_terraform" {
  image     = "ubuntu-24-04-x64"
  name      = "eaf-host-ubuntu-test-terraform"
  region    = "fra1" #frankfurt
  size      = "s-1vcpu-512mb-10gb"
  # este fichero es un ejecutor de contenedores que se ejecuta cuando el droplet este levantado
  # se llama tambien cloud-config
  user_data = file("userdata.yaml")
  monitoring = true
  tags = ["eaf-host-ubuntu-test-terraform"]
  ssh_keys  = ["${digitalocean_ssh_key.test_terraform.fingerprint}"]
}
