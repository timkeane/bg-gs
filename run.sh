#!/bin/bash

USER=admin
PASS=geoserver
HOST=localhost
PORT=8080

GS=$HOST:$PORT/geoserver
WFS=http://$GS/wfs?REQUEST=GETCAPABILITIES
WFST=http://$USER:$PASS@$GS/wfs?REQUEST=TRANSACTION
REST=http://$USER:$PASS@$GS/rest
DIR=./init/geoserver
HDR="Content-type: application/json"

docker-compose up -d

while true
do
  sleep 5

  STATUS=$(curl -s -o /dev/null -w '%{http_code}' $WFS)

  if [ $STATUS -eq 200 ]; then
    echo ''
    echo '============== Configuring GeoServer... =============='
    echo ''

    curl -X POST -H "$HDR" -d @$DIR/namespace.json $REST/namespaces.json
    echo ''
    curl -X POST -H "$HDR" -d @$DIR/datastore.json $REST/workspaces/basicgov/datastores.json
    echo ''
    curl -X POST -H "$HDR" -d @$DIR/featuretype.json $REST/workspaces/basicgov/datastores/postgis/featuretypes.json
    echo ''
    curl -X POST -H "Content-type: application/xml" -d @$DIR/insert.xml $WFST
    echo ''

    echo ''
    echo '============== GeoServer is configured! =============='
    echo ''

    break
  else
    echo ''
    echo '============== Waiting for GeoServer... =============='
  fi
  sleep 5
done

