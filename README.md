# n8n — Workflow Automation on Railway

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template/TEMPLATE_CODE)

Deploy [n8n](https://n8n.io), the open-source workflow automation platform, on Railway with one click. Build complex automations connecting 400+ apps with a visual drag-and-drop editor — self-hosted with full data ownership.

## What's Included

| Service | Image | Purpose |
|---|---|---|
| **n8n** | `n8nio/n8n:2.19.2` | Workflow automation engine + web UI |
| **PostgreSQL** | Railway Managed | Workflow data, credentials, executions |

## Features

- **400+ Integrations** — Connect to Slack, Google Sheets, Airtable, GitHub, Notion, and more
- **Visual Editor** — Drag-and-drop workflow builder with branching, loops, and error handling
- **AI Workflows** — Built-in AI agent nodes with LangChain support
- **Code When Needed** — JavaScript/Python code nodes for custom logic
- **Webhook Triggers** — Receive webhooks to trigger workflows in real-time
- **Scheduled Workflows** — Cron-based triggers for recurring automations
- **Self-Hosted** — Full data ownership, no per-workflow limits

## How to Deploy

### One-Click Deploy
Click the "Deploy on Railway" button above.

### Manual Deploy via CLI

```bash
brew install railway
railway login
railway init --name n8n
railway add --database postgres
railway up -d
railway domain
```

### After Deployment

1. Open the generated URL
2. Create your admin account
3. Start building workflows

## Environment Variables

| Variable | Description | Default |
|---|---|---|
| `DB_TYPE` | Database type | `postgresdb` |
| `DB_POSTGRESDB_HOST` | PostgreSQL host | Auto-configured |
| `DB_POSTGRESDB_DATABASE` | Database name | Auto-configured |
| `N8N_ENCRYPTION_KEY` | Encryption key for credentials | Auto-generated |
| `WEBHOOK_URL` | Public URL for webhooks | Auto-configured |
| `N8N_PORT` | Application port | `5678` |

## Estimated Cost

~$5-10/month on Railway (n8n + PostgreSQL). Stays flat regardless of workflow count.

## Notes

- **Persistent storage**: PostgreSQL handles all data persistence. The `/home/node/.n8n` volume stores the encryption key.
- **Webhooks**: Set `WEBHOOK_URL` to your Railway domain for webhook triggers to work
- **Upgrades**: Update the image tag in the Dockerfile to upgrade n8n

## License

n8n is licensed under [Sustainable Use License](https://github.com/n8n-io/n8n/blob/master/LICENSE.md) — free for personal and small business use.
