FROM n8nio/n8n:2.19.2

USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n
USER node

ENV N8N_PORT=5678
ENV NODE_ENV=production
ENV N8N_DIAGNOSTICS_ENABLED=false
ENV GENERIC_TIMEZONE=UTC

EXPOSE 5678
