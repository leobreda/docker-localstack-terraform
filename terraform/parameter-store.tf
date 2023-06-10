resource "aws_ssm_parameter" "LoremIpsum" {
  name  = "/lorem/ipsum"
  type  = "String"
  value = "Samet Dolor"
}

resource "aws_ssm_parameter" "email" {
  name  = "/email/endereco"
  type  = "String"
  value = "meu@email.com"
}