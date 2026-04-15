#!/bin/bash

curl --location 'https://api.azionapi.net/domains?page_size=100' \
  --header 'Accept: application/json; version=3' \
  --header "Authorization: Token $AZION_API_TOKEN" | jq -r '.results[] | "\(.id) \(.name) \(.domain_name)"' | column -t | grep -i $DESIRED_DOMAIN_NAME | grep -i $DESIRED_ENV