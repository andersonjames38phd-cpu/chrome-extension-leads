#!/usr/bin/env bash
# Chrome Web Store Scraper - curl examples
# Replace YOUR_TOKEN with an Apify API token (https://console.apify.com/account/integrations).

set -euo pipefail

ACTOR="Turboextract~chrome-extension-leads"
TOKEN="${APIFY_TOKEN:-YOUR_TOKEN}"

# 1. CRM and LinkedIn extensions with 1,000+ users and an email (start a run)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/runs?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "searchQueries": [
      "crm",
      "linkedin"
    ],
    "minUsers": 1000,
    "requireEmail": true
  }'

# 2. Productivity tools from registered businesses (start a run)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/runs?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "categories": [
      "productivity/tools",
      "productivity/workflow"
    ],
    "traderOnly": true
  }'

# 3. Check specific extensions (wait and get the dataset items in one call)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/run-sync-get-dataset-items?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "extensionUrls": [
      "https://chromewebstore.google.com/detail/kbfnbcaeplbcioakkpcpgfkobkghlhen"
    ]
  }'
