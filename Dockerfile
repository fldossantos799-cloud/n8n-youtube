# Estágio 1: Pega o FFmpeg pronto
FROM mwader/static-ffmpeg:6.0 AS ffmpeg-source

# Estágio 2: Imagem oficial do n8n
FROM n8nio/n8n:latest

# Muda para usuário root para ter permissão de instalar coisas
USER root

# Copia os binários do FFmpeg para dentro do n8n
COPY --from=ffmpeg-source /ffmpeg /usr/local/bin/
COPY --from=ffmpeg-source /ffprobe /usr/local/bin/

# Garante que o n8n consiga rodar os comandos
RUN chmod +x /usr/local/bin/ffmpeg

# Volta para o usuário padrão do n8n por segurança
USER node
