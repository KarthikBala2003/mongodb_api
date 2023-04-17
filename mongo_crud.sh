#!/usr/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BOLD=$(tput bold)
BLINK=$(tput blink)
RESET=$(tput sgr0)

apikey_file="$HOME/.ssh/mongodb_apikey.txt"
apikey=""
response=""

 if [ -f "$apikey_file" ]; then
        apikey="$(<~/.ssh/mongodb_apikey.txt)"
        echo "$apikey"
else
        echo "API Key file ${BOLD}${RED}$token_file${RESET} not found"
fi

function get_user_detail_by_firstname() {

    response="$(curl --location "https://data.mongodb-api.com/app/data-wifoa/endpoint/data/beta/action/findOne" \
    --header "Content-Type: application/json" \
    --header "api-key: $apikey" \
    --data '{
        "collection": "Customers",
        "database": "SynoCustomers",
        "dataSource": "Cluster0",
        "filter": {
            "Firstname": "Vish"
        }
    }' | json_pp)"
}

get_user_detail_by_firstname
echo "$response"

