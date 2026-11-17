// Chrome Web Store Scraper - Node.js example
// npm install apify-client
// APIFY_TOKEN=your_token node node.mjs
import { ApifyClient } from 'apify-client';

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });

// Productivity tools from registered businesses
const run = await client.actor('Turboextract/chrome-extension-leads').call({
    "categories": [
        "productivity/tools",
        "productivity/workflow"
    ],
    "traderOnly": true
});

const { items } = await client.dataset(run.defaultDatasetId).listItems();
for (const item of items) {
    console.log(item.name, item.users, item.rating, item.url);
}
