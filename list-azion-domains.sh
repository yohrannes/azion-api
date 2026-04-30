#!/bin/bash
source ./cli.conf

curl --location 'https://api.azionapi.net/domains?page_size=100' \
  --header 'Accept: application/json; version=3' \
  --header "Authorization: Token $PERSONAL_TOKEN" \
  | jq -r '.results[] | "\(.id) \(.name) \(.domain_name)"' \
  | column -t | grep -i $DOMAIN | grep -i $ENV