all: state counties

state: tx.geojson

counties: counties/tx_counties.geojson \
	counties/tx_counties.topojson \
	counties/individual

clean: 
	rm -f tx.geojson
	rm -rf counties/


# $@ is name of target
# $< is name of first dependency

tx.geojson: source/texas.shp
	ogr2ogr -f 'GeoJSON' $@ $<

counties/tx_counties.geojson: source/tx_counties.shp
	mkdir -p counties
	ogr2ogr -f 'GeoJSON' $@ $<

counties/tx_counties.topojson: source/tx_counties.shp
	mkdir -p counties
	topojson -o $@ --no-pre-quantization \
		--post-quantization=1e6 --simplify 7e-7 \
		--properties \
		--id-property=+FIPS $<

counties/individual/%.geojson: source/tx_counties.shp
	mkdir -p counties/individual
	ogr2ogr -f 'GeoJSON' -where "COUNTY = '$(subst _, ,$*)'" $@ $<

counties/individual: \
	counties/individual/Anderson_County.geojson \
	counties/individual/Andrews_County.geojson \
	counties/individual/Angelina_County.geojson \
	counties/individual/Aransas_County.geojson \
	counties/individual/Archer_County.geojson \
	counties/individual/Armstrong_County.geojson \
	counties/individual/Atascosa_County.geojson \
	counties/individual/Austin_County.geojson \
	counties/individual/Bailey_County.geojson \
	counties/individual/Bandera_County.geojson \
	counties/individual/Bastrop_County.geojson \
	counties/individual/Baylor_County.geojson \
	counties/individual/Bee_County.geojson \
	counties/individual/Bell_County.geojson \
	counties/individual/Bexar_County.geojson \
	counties/individual/Blanco_County.geojson \
	counties/individual/Borden_County.geojson \
	counties/individual/Bosque_County.geojson \
	counties/individual/Bowie_County.geojson \
	counties/individual/Brazoria_County.geojson \
	counties/individual/Brazos_County.geojson \
	counties/individual/Brewster_County.geojson \
	counties/individual/Briscoe_County.geojson \
	counties/individual/Brooks_County.geojson \
	counties/individual/Brown_County.geojson \
	counties/individual/Burleson_County.geojson \
	counties/individual/Burnet_County.geojson \
	counties/individual/Caldwell_County.geojson \
	counties/individual/Calhoun_County.geojson \
	counties/individual/Callahan_County.geojson \
	counties/individual/Cameron_County.geojson \
	counties/individual/Camp_County.geojson \
	counties/individual/Carson_County.geojson \
	counties/individual/Cass_County.geojson \
	counties/individual/Castro_County.geojson \
	counties/individual/Chambers_County.geojson \
	counties/individual/Cherokee_County.geojson \
	counties/individual/Childress_County.geojson \
	counties/individual/Clay_County.geojson \
	counties/individual/Cochran_County.geojson \
	counties/individual/Coke_County.geojson \
	counties/individual/Coleman_County.geojson \
	counties/individual/Collin_County.geojson \
	counties/individual/Collingsworth_County.geojson \
	counties/individual/Colorado_County.geojson \
	counties/individual/Comal_County.geojson \
	counties/individual/Comanche_County.geojson \
	counties/individual/Concho_County.geojson \
	counties/individual/Cooke_County.geojson \
	counties/individual/Coryell_County.geojson \
	counties/individual/Cottle_County.geojson \
	counties/individual/Crane_County.geojson \
	counties/individual/Crockett_County.geojson \
	counties/individual/Crosby_County.geojson \
	counties/individual/Culberson_County.geojson \
	counties/individual/Dallam_County.geojson \
	counties/individual/Dallas_County.geojson \
	counties/individual/Dawson_County.geojson \
	counties/individual/DeWitt_County.geojson \
	counties/individual/Deaf_Smith_County.geojson \
	counties/individual/Delta_County.geojson \
	counties/individual/Denton_County.geojson \
	counties/individual/Dickens_County.geojson \
	counties/individual/Dimmit_County.geojson \
	counties/individual/Donley_County.geojson \
	counties/individual/Duval_County.geojson \
	counties/individual/Eastland_County.geojson \
	counties/individual/Ector_County.geojson \
	counties/individual/Edwards_County.geojson \
	counties/individual/El_Paso_County.geojson \
	counties/individual/Ellis_County.geojson \
	counties/individual/Erath_County.geojson \
	counties/individual/Falls_County.geojson \
	counties/individual/Fannin_County.geojson \
	counties/individual/Fayette_County.geojson \
	counties/individual/Fisher_County.geojson \
	counties/individual/Floyd_County.geojson \
	counties/individual/Foard_County.geojson \
	counties/individual/Fort_Bend_County.geojson \
	counties/individual/Franklin_County.geojson \
	counties/individual/Freestone_County.geojson \
	counties/individual/Frio_County.geojson \
	counties/individual/Gaines_County.geojson \
	counties/individual/Galveston_County.geojson \
	counties/individual/Garza_County.geojson \
	counties/individual/Gillespie_County.geojson \
	counties/individual/Glasscock_County.geojson \
	counties/individual/Goliad_County.geojson \
	counties/individual/Gonzales_County.geojson \
	counties/individual/Gray_County.geojson \
	counties/individual/Grayson_County.geojson \
	counties/individual/Gregg_County.geojson \
	counties/individual/Grimes_County.geojson \
	counties/individual/Guadalupe_County.geojson \
	counties/individual/Hale_County.geojson \
	counties/individual/Hall_County.geojson \
	counties/individual/Hamilton_County.geojson \
	counties/individual/Hansford_County.geojson \
	counties/individual/Hardeman_County.geojson \
	counties/individual/Hardin_County.geojson \
	counties/individual/Harris_County.geojson \
	counties/individual/Harrison_County.geojson \
	counties/individual/Hartley_County.geojson \
	counties/individual/Haskell_County.geojson \
	counties/individual/Hays_County.geojson \
	counties/individual/Hemphill_County.geojson \
	counties/individual/Henderson_County.geojson \
	counties/individual/Hidalgo_County.geojson \
	counties/individual/Hill_County.geojson \
	counties/individual/Hockley_County.geojson \
	counties/individual/Hood_County.geojson \
	counties/individual/Hopkins_County.geojson \
	counties/individual/Houston_County.geojson \
	counties/individual/Howard_County.geojson \
	counties/individual/Hudspeth_County.geojson \
	counties/individual/Hunt_County.geojson \
	counties/individual/Hutchinson_County.geojson \
	counties/individual/Irion_County.geojson \
	counties/individual/Jack_County.geojson \
	counties/individual/Jackson_County.geojson \
	counties/individual/Jasper_County.geojson \
	counties/individual/Jeff_Davis_County.geojson \
	counties/individual/Jefferson_County.geojson \
	counties/individual/Jim_Hogg_County.geojson \
	counties/individual/Jim_Wells_County.geojson \
	counties/individual/Johnson_County.geojson \
	counties/individual/Jones_County.geojson \
	counties/individual/Karnes_County.geojson \
	counties/individual/Kaufman_County.geojson \
	counties/individual/Kendall_County.geojson \
	counties/individual/Kenedy_County.geojson \
	counties/individual/Kent_County.geojson \
	counties/individual/Kerr_County.geojson \
	counties/individual/Kimble_County.geojson \
	counties/individual/King_County.geojson \
	counties/individual/Kinney_County.geojson \
	counties/individual/Kleberg_County.geojson \
	counties/individual/Knox_County.geojson \
	counties/individual/La_Salle_County.geojson \
	counties/individual/Lamar_County.geojson \
	counties/individual/Lamb_County.geojson \
	counties/individual/Lampasas_County.geojson \
	counties/individual/Lavaca_County.geojson \
	counties/individual/Lee_County.geojson \
	counties/individual/Leon_County.geojson \
	counties/individual/Liberty_County.geojson \
	counties/individual/Limestone_County.geojson \
	counties/individual/Lipscomb_County.geojson \
	counties/individual/Live_Oak_County.geojson \
	counties/individual/Llano_County.geojson \
	counties/individual/Loving_County.geojson \
	counties/individual/Lubbock_County.geojson \
	counties/individual/Lynn_County.geojson \
	counties/individual/Madison_County.geojson \
	counties/individual/Marion_County.geojson \
	counties/individual/Martin_County.geojson \
	counties/individual/Mason_County.geojson \
	counties/individual/Matagorda_County.geojson \
	counties/individual/Maverick_County.geojson \
	counties/individual/McCulloch_County.geojson \
	counties/individual/McLennan_County.geojson \
	counties/individual/McMullen_County.geojson \
	counties/individual/Medina_County.geojson \
	counties/individual/Menard_County.geojson \
	counties/individual/Midland_County.geojson \
	counties/individual/Milam_County.geojson \
	counties/individual/Mills_County.geojson \
	counties/individual/Mitchell_County.geojson \
	counties/individual/Montague_County.geojson \
	counties/individual/Montgomery_County.geojson \
	counties/individual/Moore_County.geojson \
	counties/individual/Morris_County.geojson \
	counties/individual/Motley_County.geojson \
	counties/individual/Nacogdoches_County.geojson \
	counties/individual/Navarro_County.geojson \
	counties/individual/Newton_County.geojson \
	counties/individual/Nolan_County.geojson \
	counties/individual/Nueces_County.geojson \
	counties/individual/Ochiltree_County.geojson \
	counties/individual/Oldham_County.geojson \
	counties/individual/Orange_County.geojson \
	counties/individual/Palo_Pinto_County.geojson \
	counties/individual/Panola_County.geojson \
	counties/individual/Parker_County.geojson \
	counties/individual/Parmer_County.geojson \
	counties/individual/Pecos_County.geojson \
	counties/individual/Polk_County.geojson \
	counties/individual/Potter_County.geojson \
	counties/individual/Presidio_County.geojson \
	counties/individual/Rains_County.geojson \
	counties/individual/Randall_County.geojson \
	counties/individual/Reagan_County.geojson \
	counties/individual/Real_County.geojson \
	counties/individual/Red_River_County.geojson \
	counties/individual/Reeves_County.geojson \
	counties/individual/Refugio_County.geojson \
	counties/individual/Roberts_County.geojson \
	counties/individual/Robertson_County.geojson \
	counties/individual/Rockwall_County.geojson \
	counties/individual/Runnels_County.geojson \
	counties/individual/Rusk_County.geojson \
	counties/individual/Sabine_County.geojson \
	counties/individual/San_Augustine_County.geojson \
	counties/individual/San_Jacinto_County.geojson \
	counties/individual/San_Patricio_County.geojson \
	counties/individual/San_Saba_County.geojson \
	counties/individual/Schleicher_County.geojson \
	counties/individual/Scurry_County.geojson \
	counties/individual/Shackelford_County.geojson \
	counties/individual/Shelby_County.geojson \
	counties/individual/Sherman_County.geojson \
	counties/individual/Smith_County.geojson \
	counties/individual/Somervell_County.geojson \
	counties/individual/Starr_County.geojson \
	counties/individual/Stephens_County.geojson \
	counties/individual/Sterling_County.geojson \
	counties/individual/Stonewall_County.geojson \
	counties/individual/Sutton_County.geojson \
	counties/individual/Swisher_County.geojson \
	counties/individual/Tarrant_County.geojson \
	counties/individual/Taylor_County.geojson \
	counties/individual/Terrell_County.geojson \
	counties/individual/Terry_County.geojson \
	counties/individual/Throckmorton_County.geojson \
	counties/individual/Titus_County.geojson \
	counties/individual/Tom_Green_County.geojson \
	counties/individual/Travis_County.geojson \
	counties/individual/Trinity_County.geojson \
	counties/individual/Tyler_County.geojson \
	counties/individual/Upshur_County.geojson \
	counties/individual/Upton_County.geojson \
	counties/individual/Uvalde_County.geojson \
	counties/individual/Val_Verde_County.geojson \
	counties/individual/Van_Zandt_County.geojson \
	counties/individual/Victoria_County.geojson \
	counties/individual/Walker_County.geojson \
	counties/individual/Waller_County.geojson \
	counties/individual/Ward_County.geojson \
	counties/individual/Washington_County.geojson \
	counties/individual/Webb_County.geojson \
	counties/individual/Wharton_County.geojson \
	counties/individual/Wheeler_County.geojson \
	counties/individual/Wichita_County.geojson \
	counties/individual/Wilbarger_County.geojson \
	counties/individual/Willacy_County.geojson \
	counties/individual/Williamson_County.geojson \
	counties/individual/Wilson_County.geojson \
	counties/individual/Winkler_County.geojson \
	counties/individual/Wise_County.geojson \
	counties/individual/Wood_County.geojson \
	counties/individual/Yoakum_County.geojson \
	counties/individual/Young_County.geojson \
	counties/individual/Zapata_County.geojson \
	counties/individual/Zavala_County.geojson


