#!/bin/bash

# Diretórios
ORIGEM="/home/matheus/.local/share/DBeaverData/workspace6"
DESTINO="/home/matheus/Insync/matheusgeres@gmail.com/Google Drive/DBeaverBackups"

# Nome do arquivo de backup com timestamp
DATA=$(date +"%Y-%m-%d_%H-%M-%S")
ARQUIVO="DBeaverData_backup_$DATA.tar.gz"

# Compactar o diretório de origem

echo "Compactando o diretório..."
tar -czvf "$ARQUIVO" -C "$ORIGEM" .

echo "Movendo o arquivo para o diretório de destino..."
mv "$ARQUIVO" "$DESTINO"

echo "Backup concluído com sucesso!"
