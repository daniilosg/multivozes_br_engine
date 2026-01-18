# Usando imagem base do Python
FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=5050

# Definir o diretório de trabalho dentro do container
WORKDIR /multivozes_br_engine

# Instalar dependências do sistema
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Copiar o requirements.txt para o diretório de trabalho
COPY requirements.txt .

# Instalar as dependências necessárias
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o restante dos arquivos da aplicação
COPY . .

# Comando para rodar o aplicativo Python
CMD ["python", "main.py"]
