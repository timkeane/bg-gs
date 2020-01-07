# bg-gs

A docker-compose project to run PostGIS and GeoServer for use by BasicGov for testing

## Prerequisites
* bash shell
* Docker

## Usage
* Execute `./run.sh` from the project root
  * Runs `docker-compose up` (see `docker-compose.yml`)
  * Creates an empty `parade` table in PostGIS `gis` database
  * Creates a `basicgov` namespace in GeoServer
  * Creates a `postgis` datastore in GeoServer
  * Creates a `parade` layer in GeoServer
  * Uses WFS-T to add The Saint Patrick's Day Parade to the `parade` layer
* Everything is ready to go when you see
   * `============== GeoServer is configured! ==============`

## GeoServer
* Admin Console
    * http://localhost:8080/geoserver/web
      * user: `admin`
      * password: `geoserver`
* WMS
  * http://localhost:8080/geoserver/wms
* WFS
  * http://localhost:8080/geoserver/wfs
* WFS-T
  * http://localhost:8080/geoserver/wfs
      * user: `admin`
      * password: `geoserver`
      
## PostGIS
If a PostgreSQL client is available you can connect
  * host: `localhost`
  * host: `localhost`
  * database: `gis`
  * user: `docker`
  * password: `docker`  
