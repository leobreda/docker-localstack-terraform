# docker-localstack-terraform
Simulando um ambiente da AWS local.

Como isso é possível? Através do LocalStack: uma ferramenta capaz de simular a maioria dos componentes AWS (Parameter Store, SQS, Secrets, etc).

No vídeo a seguir, explico a instalação de uma stack no Linux, composto por Docker, LocalStack, AWSCLI e provisionando a infra usando Terraform.

https://www.youtube.com/watch?v=c-bYqrQF98Y

[![Simulando um ambiente da AWS local](https://img.youtube.com/vi/c-bYqrQF98Y/0.jpg)](https://www.youtube.com/watch?v=c-bYqrQF98Y)

---

## Instalando Docker
```
chmod +x instalando-docker.sh
./instalando-docker.sh
```

## Instalando Localstack
```
chmod +x instalando-localstack.sh
./instalando-localstack.sh
```

## Executando Localstack (localhost)

Em localhost:
```
localstack start --host
```
Rodando em segundo plano:
```
nohup localstack start --host > localstack.log &
```

## Instalando e executando via Docker Compose

```
cd /docker-compose
docker-compose -f localstack.yml up
``` 

Rodando em segundo plano:
```
nohup docker-compose -f localstack.yml up > localstack.log &
```


## Instalando AWSCLI
```
chmod +x instalando-awscli.sh
./instalando-awscli.sh
```

Configurando AWSCLI
```
aws configure
AWS Access Key ID [None]: fake
AWS Secret Access Key [None]: fake
Default region name [None]: sa-east-1
Default output format [None]:
```

## SQS

Criando tópico:
```
aws --endpoint-url=http://localhost:4566 sqs create-queue --queue-name teste
```
Resultado esperado:
```
{
    "QueueUrl": "http://localhost:4566/000000000000/teste"
}
```

Listando tópicos:
```
aws --endpoint-url=http://localhost:4566 sqs list-queues
```


Inserindo mensagens no tópico:
```
aws --endpoint-url=http://localhost:4566 sqs send-message --queue-url http://localhost:4566/000000000000/teste --message-body "Hello World!"
```
Resultado esperado:
```
{
    "MD5OfMessageBody": "ed076287532e86365e841e92bfc50d8c",
    "MessageId": "ecec958a-93ac-477d-a573-5ddfe0158c01"
}
```

Lendo mensagens no tópico:
```
aws --endpoint-url=http://localhost:4566 sqs receive-message --queue-url http://localhost:4566/000000000000/teste
```
Resultado esperado:
```
{
    "Messages": [
        {
            "MessageId": "ecec958a-93ac-477d-a573-5ddfe0158c01",
            "ReceiptHandle": "NmNlZGQxNzUtNDBiYS00ZWFmLWI2MmEtYjJkOWE2NGY2ZGIyIGFybjphd3M6c3FzOnNhLWVhc3QtMTowMDAwMDAwMDAwMDA6dGVzdGUgZWNlYzk1OGEtOTNhYy00NzdkLWE1NzMtNWRkZmUwMTU4YzAxIDE2ODY0MTMyMjguMDQ0MTgyMw==",
            "MD5OfBody": "ed076287532e86365e841e92bfc50d8c",
            "Body": "Hello World!"
        }
    ]
}
```

##  Terraform
Instalando:

```
chmod +x instalando-terraform.sh
./instalando-terraform.sh
```

Criando objetos no Localstack via Terraform:
```
cd terraform
terraform init
terraform plan
terraform apply
```

---

## Listando objetos criados via Terraform

### SQS
```
aws --endpoint-url=http://localhost:4566 sqs list-queues
```
----
### Parameter Store
```
aws --endpoint-url=http://localhost:4566 ssm describe-parameters
```

Ler o valor do Parameter Store:
```
aws --endpoint-url=http://localhost:4566 ssm get-parameters --name "/lorem/ipsum"
``` 
---
### Secrets Manager
Listar Secrets:
```
aws --endpoint-url=http://localhost:4566 secretsmanager list-secrets
``` 

Recuperar valor da Secret:

vai dar um erro, pois ainda não configuramos o valor do segredo :-/
```
aws --endpoint-url=http://localhost:4566 secretsmanager get-secret-value --secret-id MY_SECRET
```

Configurar o valor da Secret:
```
aws --endpoint-url=http://localhost:4566 secretsmanager put-secret-value --secret-id "MY_SECRET" --secret-string "qwert"
```