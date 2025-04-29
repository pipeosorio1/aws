FROM amazon/aws-cli:2.26.6

# Instala todo en una sola capa para reducir tamaño
RUN yum install -y curl tar gzip openssl && \
    # Instala eksctl
    curl -sL https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz | tar xz -C /usr/local/bin && \
    chmod +x /usr/local/bin/eksctl && \
    # Instala kubectl
    curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm kubectl && \
    # Instala helm (requiere openssl)
    curl -s https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash && \
    # Instala k9s
    curl -sL https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_amd64.tar.gz | tar xz -C /usr/local/bin && \
    chmod +x /usr/local/bin/k9s

# Copia el archivo entrypoint.sh
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Asegúrate de que el script sea ejecutable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Establece el entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Por defecto ejecuta bash
CMD ["sleep", "infinity"]
