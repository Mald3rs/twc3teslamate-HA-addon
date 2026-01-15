# TWC3 Teslamate Home Assistant Add-on

Home Assistant add-on that simulates a Tesla Wall Connector Gen3 API using data from Teslamate via MQTT. This enables integrations like [evcc](https://evcc.io/) to work with Tesla vehicles.

Based on [twc3teslamate](https://github.com/Haveacry/twc3teslamate) by Haveacry.

## Installation

1. Go to **Settings → Add-ons → Add-on Store**
2. Click **⋮** (menu) → **Repositories**
3. Add: `https://github.com/Mald3rs/twc3teslamate-HA-addon`
4. Find "TWC3 Teslamate" and click **Install**

## Configuration

| Option | Description | Default |
|--------|-------------|---------|
| `mqtt_host` | MQTT broker hostname/IP | (required) |
| `mqtt_port` | MQTT broker port | 1883 |
| `mqtt_username` | MQTT username | (optional) |
| `mqtt_password` | MQTT password | (optional) |
| `teslamate_car_id` | Car ID for multi-car setups | 1 |
| `teslamate_geo_home` | Geofence name for home location | Home |
| `teslamate_namespace` | Teslamate MQTT namespace | (optional) |

## Requirements

- [Teslamate](https://github.com/teslamate-org/teslamate) with MQTT integration
- MQTT broker (e.g., Mosquitto)

## API Endpoint

Once running, the TWC3 API is available at:
```
http://<your-ha-ip>:8099/api/1/vitals
```

## License

GPL-2.0 - See upstream [twc3teslamate](https://github.com/Haveacry/twc3teslamate) license.
