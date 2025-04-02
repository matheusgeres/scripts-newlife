#!/bin/bash

DIRETORIO="/efi/loader/entries"

if [ ! -d "$DIRETORIO" ]; then
  echo "Diretório $DIRETORIO não encontrado!"
  exit 1
fi

for ARQUIVO in "$DIRETORIO"/*.conf; do
  # Pula arquivos que terminam com lts-fallback.conf
  if [[ "$ARQUIVO" == *lts-fallback.conf ]]; then
    echo "Ignorando $ARQUIVO (LTS fallback)"
    continue
  fi

  # Verifica se a opção já existe
  if grep -q "^options.*amdgpu.dcdebugmask=0x10" "$ARQUIVO"; then
    echo "A opção já está presente em $ARQUIVO"
  else
    echo "Adicionando a opção em $ARQUIVO"
    sed -i '/^options/s|$| amdgpu.dcdebugmask=0x10|' "$ARQUIVO"
  fi
done
