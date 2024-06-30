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
