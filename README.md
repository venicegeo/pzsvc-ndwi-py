# pzsvc-ndwi-py

The ndwi shore-finding algorithm, written in python, and made into a Piazza service via pzsvc-exec

pzsvc-ndwi-py is currently configured as a taskworker/local-only service.  As such, it receives external jobs only through the Pz instance indicated at environment variable PZ_ADDR.  On startup, assuming all environment variables are set properly and the Pz instance is working, it will autoregister itself with the name "BF_Algo_NDWI_PY", and will stand by to complete any jobs sent to that service.  An example of a reasonable, working job block is as follows:

```
{
  "data": {
    "dataInputs": {
      "body": {
        "content": "{
          \"cmd\":\"-i planet.TIF --bands 2 4 --fout ./shoreline.geojson\",
          \"inPzFiles\":[\"e21e44dc-5ccc-414a-b047-4f45cd44ea2f\"],
          \"inPzNames\":[\"planet.TIF\"],
          \"outGeoJson\":[\"shoreline.geojson\"],
          \"pzAuthKey\":\"******\"
        }",
        "type": "body",
        "mimeType": "application/json"
      }
    },
    "dataOutput": [
      {
        "mimeType": "application/json",
        "type": "text"
      }
    ],
    "serviceId": "570a97f8-0a7e-4bc1-a8d5-ba68c43c56a4"
  },
  "type": "execute-service"
}
```

auth keys have been removed for obvious reasons, but otherwise, this would be a functional request to send to the POST /job endpoint of the appropriate Pz instance.

Pertinent links:
- bfalg-ndwi readme: https://github.com/venicegeo/bfalg-ndwi/blob/develop/README.md
- pzsvc-exec readme: https://github.com/venicegeo/pzsvc-exec/blob/master/README.md
- pzsvc-ndwi config: https://github.com/venicegeo/pzsvc-ndwi-py/blob/master/pzsvc-exec.config


> TODO: revisit the necessity for creating arbitrary throwaway commits to this repo for deploying artifacts to PCF
