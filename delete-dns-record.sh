#!/bin/bash
source ./cli.conf

DNS_RECORD_ID=$(./list-dns-records.sh | jq -r --arg name "$DESIRED_SUBDOMAIN" '.results[] | select(.name==$name) | .id')
ZONE_ID=$(./list-dns-zones.sh | jq -r --arg name "$DESIRED_DOMAIN_NAME" '.results[] | select(.name==$name) | .id')


curl --request DELETE \
  --url https://api.azion.com/v4/workspace/dns/zones/$ZONE_ID/records/$DNS_RECORD_ID \
  --header 'Accept: application/json' \
  --header "Authorization: Token $AZION_API_TOKEN" | jq -r