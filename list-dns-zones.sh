#!/bin/bash
source ./cli.conf

curl --request GET \
  --url https://api.azion.com/v4/workspace/dns/zones \
  --header "Accept: application/json" \
  --header "Authorization: Token ${PERSONAL_TOKEN}" | jq -r