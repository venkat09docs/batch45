resource "null_resource" "list_of_files" {
  provisioner "local-exec" {
    command = "ls -la"
  }
  provisioner "local-exec" {
    command = "ipconfig"
  }
}
