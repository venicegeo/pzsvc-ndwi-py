#!/bin/bash -ex

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

echo "Requesting Piazza API key via piazza.$PCF_DOMAIN"
response=$(curl -s https://piazza.$PCF_DOMAIN/v2/key -u "$BEACHFRONT_PIAZZA_AUTH")
echo
echo "Response:"
echo $response|sed 's/^/    | /'

piazza_api_key=$(echo $response|grep -oE '\w{8}-\w{4}-\w{4}-\w{4}-\w{12}')
if [ -z $piazza_api_key ]; then
    echo "No Piazza API key found"
    exit 1
fi

# Add required environment variables to manifest. TODO: This shall be replaced by a more graceful method of injection in the future.
piazza_url="https://piazza.$PCF_DOMAIN"

grep -q env manifest.jenkins.yml &&
  echo "
    PZ_API_KEY: $piazza_api_key
    PZ_ADDRESS: $piazza_url" >> manifest.jenkins.yml ||
  echo "
  env:
    PZ_API_KEY: $piazza_api_key
    PZ_ADDRESS: $piazza_url" >> manifest.jenkins.yml
