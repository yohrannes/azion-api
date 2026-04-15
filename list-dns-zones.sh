#!/bin/bash

curl --request GET \
  --url https://api.azion.com/v4/workspace/dns/zones \
  --header "Accept: application/json" \
  --header "Authorization: Token $AZION_API_TOKEN" | jq -r