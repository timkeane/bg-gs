GS=http://admin:geoserver@localhost:8080/geoserver
REST=$GS/rest/
CT="Content-type: application/json"
curl -X POST -H "$CT" -d @namespace.json $REST/namespaces.json
curl -X POST -H "$CT" -d @datastore.json $REST/workspaces/basicgov/datastores.json
curl -X POST -H "$CT" -d @featuretype.json $REST/workspaces/basicgov/datastores/postgis/featuretypes.json
curl -X POST -H "Content-type: application/xml" -d @insert.xml $GS/wfs?REQUEST=TRANSACTION
