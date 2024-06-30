- Como crear droplet con terraform
  - https://www.youtube.com/watch?v=UqxebzWKigY

- Recursos "peladonerd"
  - https://github.com/pablokbs/peladonerd/blob/master/



### terraform
- brew install terraform
```sh
# se configura main.tf
terraform init
# este comando generara assets ocultos .terraform y .terraform.lock.hcl

# intenta conectarse a digital ocean y desplegar todo
terraform apply

# cuando este comando da error, hay que regenerar las ssh-keys en local
# con: ssh-keygen -t rsa -C "xxx@yyy.zz" -f digocean-terraform    

# el resultado deberia ser algo como:
digitalocean_ssh_key.test_terraform: Creating...
digitalocean_ssh_key.test_terraform: Creation complete after 0s [id=42610380]
digitalocean_droplet.dl_test_terraform: Creating...
digitalocean_droplet.dl_test_terraform: Still creating... [10s elapsed]
digitalocean_droplet.dl_test_terraform: Still creating... [20s elapsed]
digitalocean_droplet.dl_test_terraform: Still creating... [30s elapsed]
digitalocean_droplet.dl_test_terraform: Still creating... [40s elapsed]
digitalocean_droplet.dl_test_terraform: Creation complete after 42s [id=429262330]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

### config nuevo droplet
```ssh
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"eaf-host-ubuntu-test-terraform",
        "size":"s-1vcpu-512mb-10gb",
        "region":"fra1",
        "image":"ubuntu-24-04-x64",
        "monitoring":true,
        "vpc_uuid":"d62a1a35-f488-4982-8fbb-cbb76ea18adc",
        "tags":["eaf-host-ubuntu-test-terraform"]}' \
    "https://api.digitalocean.com/v2/droplets"
```
