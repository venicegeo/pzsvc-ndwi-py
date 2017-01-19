#!/bin/bash -e

if [ -z $PCF_SPACE ]; then
    echo "Cannot read PCF_SPACE from the environment"
    exit 1
fi
if [ -z $PCF_DOMAIN ]; then
    echo "Cannot read PCF_DOMAIN from the environment"
    exit 1
fi
if [ -z $BEACHFRONT_PIAZZA_AUTH ]; then
    echo "Cannot read BEACHFRONT_PIAZZA_AUTH from the environment"
    exit 1
fi

echo ###########################################################################

echo "Requesting new Piazza API key via piazza.$PCF_DOMAIN"
response=$(curl -s https://piazza.$PCF_DOMAIN/v2/key -u "$BEACHFRONT_PIAZZA_AUTH")
echo
echo "Response:"
echo $response|sed 's/^/    | /'

piazza_api_key=$(echo $response|grep -oE '\w{8}-\w{4}-\w{4}-\w{4}-\w{12}')
if [ -z $piazza_api_key ]; then
    echo "No Piazza API key found"
    exit 1
fi

manifest_filename=manifest.$PCF_SPACE.yml
echo "Writing Cloud Foundry manifest to $manifest_filename:"
cat manifest.jenkins.yml |\
    sed "s/__PZ_API_KEY__/$piazza_api_key/" |\
    sed "s/__PZ_ADDRESS__/piazza.$PCF_DOMAIN/" |\
    tee $manifest_filename |\
    sed 's/^/    | /'

echo ###########################################################################
