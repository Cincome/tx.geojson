# tx.geojson

[GeoJSON](http://geojson.org/) and [TopoJSON](https://github.com/mbostock/topojson/wiki) for the State of Texas

## Files

- `tx.geojson` - State outline
- `counties/tx_counties.geojson` - All Texas counties
- `counties/tx_counties.topojson` - TopoJSON of All Texas counties
- `counties/individual/*.geojson` - Individual Texas counties

## Source Data

Source shapefiles are in `/source`. Source files were downloaded from the [http://nationalatlas.gov/](http://nationalatlas.gov/).

## Recreating JSON files

Prerequisites:

- GDAL/OGR: `apt-get install gdal-bin`
- topojson: `npm install -g topojson`

Then just run `make all`