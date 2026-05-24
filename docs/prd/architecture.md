---
title: Architecture
---
# Architecture

```mermaid
graph TD
    A[PWA Android] -->|HTTPS| B[API Gateway AWS]
    B --> C[Bedrock Agent · Claude Sonnet 4]
    C -->|MCP| D[MCP Server Saxo Bank]
    D -->|OpenAPI| E[Saxo Bank]
    C --> F[FiscalEngine Lambda]
    F --> G[Secrets Manager · KMS]
```

Stack complet : React PWA · AWS Bedrock · MCP Server Python · Saxo OpenAPI · Terraform · GitHub Actions.
