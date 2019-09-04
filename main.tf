#data "external" "slow-data-source-external" {
#  program = ["curl",  "http://nothing-to-see-here-but-really-this-is-for-mock-games-delete.s3-website-us-west-2.amazonaws.com/"]
#}

resource "null_resource" "foobar" {
  provisioner "local-exec" {
    command = <<EOT
      curl http://nothing-to-see-here-but-really-this-is-for-mock-games-delete.s3-website-us-west-2.amazonaws.com/
    EOT
  }
}

resource "random_id" "random" {
  keepers = {
    uuid = "${uuid()}"
  }

  byte_length = 8
}

output "random" {
  value = "${random_id.random.hex}"
}
