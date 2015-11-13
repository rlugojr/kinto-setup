#!/bin/bash

AUTH="mark:p4ssw0rd"
SERVER_URL=https://kinto.dev.mozaws.net/v1

if ! which curl > /dev/null; then echo "Please install cURL first"; exit 1; fi

echo -e "Setup OneCRL blocklist: $SERVER_URL/buckets/onecrl/collections/blocklist/records\n"
curl -u "$AUTH" -H "Content-Type: application/json" --data @exports/blocklist/certificates.json "$SERVER_URL/batch" || echo "Error loading the file."

echo -e "\n\n\nSetup AMO blocklist: $SERVER_URL/buckets/addons/collections/blocklist/records\n"
curl -u "$AUTH" -H "Content-Type: application/json" --data @exports/blocklist/addons.json "$SERVER_URL/batch" || echo "Error loading the file."

echo -e "\n\n\nSetup Plugins blocklist: $SERVER_URL/buckets/plugins/collections/blocklist/records\n"
curl -u "$AUTH" -H "Content-Type: application/json" --data @exports/blocklist/plugins.json "$SERVER_URL/batch" || echo "Error loading the file."

echo -e "\n\n\nSetup GFX drivers blocklist: $SERVER_URL/buckets/gfx/collections/blocklist/records\n"
curl -u "$AUTH" -H "Content-Type: application/json" --data @exports/blocklist/gfx.json "$SERVER_URL/batch" || echo "Error loading the file."
