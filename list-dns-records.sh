#!/bin/bash
./cli.sh $SUBDOMAIN $DOMAIN $TARGET_DOMAIN $ENV $PERSONAL_TOKEN

ZONE_ID=$(./list-dns-zones.sh | jq -r --arg name "$DOMAIN" '.results[] | select(.name==$name) | .id')

curl --request GET \
  --url "https://api.azion.com/v4/workspace/dns/zones/${ZONE_ID}/records?page_size=100" \
  --header 'Accept: application/json' \
  --header "Authorization: Token $PERSONAL_TOKEN" | jq -r