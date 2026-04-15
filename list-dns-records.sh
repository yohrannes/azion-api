#!/bin/bash

ZONE_ID=$(./list-dns-zones.sh | jq -r --arg name "$DESIRED_DOMAIN_NAME" '.results[] | select(.name==$name) | .id')

curl --request GET \
  --url "https://api.azion.com/v4/workspace/dns/zones/${ZONE_ID}/records?page_size=100" \
  --header 'Accept: application/json' \
  --header "Authorization: Token $AZION_API_TOKEN" | jq -r