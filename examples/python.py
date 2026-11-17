"""Chrome Web Store Scraper - Python example.

pip install apify-client
export APIFY_TOKEN=your_token
"""
import os

from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])

# CRM and LinkedIn extensions with 1,000+ users and an email
run = client.actor("Turboextract/chrome-extension-leads").call(run_input={
    "searchQueries": [
        "crm",
        "linkedin"
    ],
    "minUsers": 1000,
    "requireEmail": True
})

# Stream every item
for item in client.dataset(run["defaultDatasetId"]).iterate_items():
    print(item.get("name"), item.get("users"), item.get("rating"), item.get("url"))

# Or fetch one page of items
page = client.dataset(run["defaultDatasetId"]).list_items(limit=100)
print(f"{page.total} items in dataset")
