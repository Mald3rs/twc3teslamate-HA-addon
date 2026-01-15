#!/usr/bin/with-contenv bashio

export MQTT_HOST=$(bashio::config 'mqtt_host')
export MQTT_PORT=$(bashio::config 'mqtt_port')
export TESLAMATE_CAR_ID=$(bashio::config 'teslamate_car_id')
export TESLAMATE_GEO_HOME=$(bashio::config 'teslamate_geo_home')

if bashio::config.has_value 'mqtt_username'; then
    export MQTT_USERNAME=$(bashio::config 'mqtt_username')
fi

if bashio::config.has_value 'mqtt_password'; then
    export MQTT_PASSWORD=$(bashio::config 'mqtt_password')
fi

if bashio::config.has_value 'teslamate_namespace'; then
    export TESLAMATE_NAMESPACE=$(bashio::config 'teslamate_namespace')
fi

cd /app
exec uvicorn app.main:app --host 0.0.0.0 --port 80
