# Deploy and Host n8n-self-hosted on Railway

n8n is an open-source workflow automation platform that connects 400+ apps, APIs, and AI models through a visual drag-and-drop editor. Think Zapier, but you own the server. Build anything from a simple "new lead → Slack notification" zap to a multi-step AI agent that researches, writes, and publishes — with no per-workflow limits and no vendor lock-in.

## About Hosting n8n-self-hosted

Here's the math that makes self-hosting obvious: n8n Cloud charges $24/month for 2,500 executions. A busy team burns through that in a week. Self-hosting on Railway? ~$5-10/month with unlimited executions. That's a ~$240/year saving at minimum. This template deploys n8n with a managed PostgreSQL database, auto-generated encryption keys, and a public HTTPS domain — all pre-wired. Railway handles SSL, networking, and container restarts so you don't touch infrastructure. Your workflows, credentials, and execution data stay on your own instance. No third-party analytics. No usage caps. And because it's Railway, you can scale up with a slider if your automations get heavy.

## Common Use Cases

- **AI agent workflows** — Build LangChain-powered agents that research topics, summarize findings, and post results to Slack. n8n's AI nodes support OpenAI, Anthropic, and local LLMs with built-in memory — no Python scripting required
- **CRM and sales automation** — Sync leads between HubSpot, Salesforce, Google Sheets, and Slack automatically. One user reported cutting their lead response time from 4 hours to 12 minutes with a three-node workflow
- **Product ops without engineering** — Automate feedback triage from Typeform to Linear, sync Mixpanel cohorts to your email tool, and generate weekly product metrics reports. Product managers can own these workflows without filing engineering tickets
- **Data pipelines on a schedule** — Pull data from REST APIs, transform it with JavaScript or Python code nodes, and load into PostgreSQL, Airtable, or Google Sheets. Set cron triggers to run hourly, daily, or weekly
- **DevOps monitoring and alerts** — Watch GitHub repos for new issues, trigger CI/CD pipelines on merge, post deploy notifications to Discord, and auto-create Jira tickets when error thresholds spike
- **Content distribution** — Auto-publish blog posts to WordPress, schedule social posts across platforms, generate AI summaries, and track engagement metrics — all in one workflow that runs while you sleep

## Dependencies for n8n-self-hosted Hosting

- **PostgreSQL** — Stores workflow definitions, encrypted credentials, execution history, and user accounts. Railway provisions this automatically with persistent storage and private networking
- **Persistent Volume** — Mounted at `/home/node/.n8n` for the encryption key, custom nodes, and local configuration. Without this volume, credential encryption breaks between deploys

### Deployment Dependencies

- [n8n Official Hosting Docs](https://docs.n8n.io/hosting/)
- [n8n Docker Hub Image](https://hub.docker.com/r/n8nio/n8n)
- [n8n Environment Variables Reference](https://docs.n8n.io/hosting/configuration/environment-variables/)
- [n8n Database Configuration](https://docs.n8n.io/hosting/configuration/environment-variables/database/)
- [n8n GitHub Repository](https://github.com/n8n-io/n8n)

### Implementation Details

This template runs the official `n8nio/n8n:2.19.2` image with PostgreSQL auto-wired through Railway's template variable references:

```
DB_TYPE=postgresdb
DB_POSTGRESDB_HOST=${{Postgres.PGHOST}}
DB_POSTGRESDB_PORT=${{Postgres.PGPORT}}
DB_POSTGRESDB_DATABASE=${{Postgres.PGDATABASE}}
DB_POSTGRESDB_USER=${{Postgres.PGUSER}}
DB_POSTGRESDB_PASSWORD=${{Postgres.PGPASSWORD}}
N8N_ENCRYPTION_KEY=${{secret(32)}}
WEBHOOK_URL=https://${{n8n.RAILWAY_PUBLIC_DOMAIN}}
```

The encryption key gets auto-generated at deploy time via Railway's `secret()` function — every credential stored in n8n stays encrypted at rest. The webhook URL points to your public Railway domain automatically, so webhook-triggered workflows work the moment you deploy. No DNS configuration needed.

## Why Deploy n8n-self-hosted on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying n8n-self-hosted on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.
