#!/bin/bash -e

if [ -z $PIAZZA_ADDR ]; then
    echo "Cannot read PIAZZA_ADDR from the environment"
    exit 1
fi
if [ -z $BEACHFRONT_PIAZZA_AUTH ]; then
    echo "Cannot read BEACHFRONT_PIAZZA_AUTH from the environment"
    exit 1
fi
if [ -z $MANIFEST_FILENAME ]; then
    echo "Cannot read MANIFEST_FILENAME from the environment"
    exit 1
fi

echo ###########################################################################

echo "Requesting new Piazza API key via $PIAZZA_ADDR"
response=$(curl -s https://$PIAZZA_ADDR/v2/key -u "$BEACHFRONT_PIAZZA_AUTH")
echo
echo "Response:"
echo $response|sed 's/^/    | /'

piazza_api_key=$(echo $response|grep -oE '\w{8}-\w{4}-\w{4}-\w{4}-\w{12}')
if [ -z $piazza_api_key ]; then
    echo "No Piazza API key found"
    exit 1
fi

manifest_filename=$MANIFEST_FILENAME
echo "Writing Cloud Foundry manifest to $manifest_filename:"
cat manifest.jenkins.yml |\
    sed "s/__PZ_API_KEY__/$piazza_api_key/" |\
    sed "s/__PZ_ADDRESS__/$PIAZZA_ADDR/" |\
    tee $manifest_filename |\
    sed 's/^/    | /'

echo ###########################################################################
