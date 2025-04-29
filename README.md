# Proyecto de Clúster EKS con eksctl

Este proyecto configura y administra un clúster de Kubernetes en Amazon EKS (Elastic Kubernetes Service) utilizando `eksctl`. El clúster se crea sin grupos de nodos (para que puedas configurarlos manualmente o integrarlos con otras herramientas).

## Requisitos Previos

Asegúrate de tener las siguientes herramientas y configuraciones antes de comenzar:

1. **Cuenta de AWS**: Necesitarás acceso a una cuenta de AWS con permisos adecuados para crear recursos en EKS (incluidos VPCs, roles de IAM y EIP).

2. **Docker**: Asegúrate de tener Docker instalado.

   - [Instalar Docker](https://docs.docker.com/get-docker/)

## Configuración Inicial

1. **Configurar el archivo .env**

   Crea un archivo .env en el directorio raíz de tu proyecto con las siguientes variables de entorno:

   ```bash
    AWS_ACCESS_KEY_ID=tu_access_key
    AWS_SECRET_ACCESS_KEY=tu_secret_key
    AWS_REGION=us-east-1  # O la región de tu preferencia

2. **Ejecutar comando de docker para iniciar el proyecto**

    ```bash
    make docker
    o
    docker compose up --build -d

2. **Ejecutar comando de docker para iniciar a la consola del contenedor**

    ```bash
    make exec
    o
    docker exec -it aws-toolbox bash