# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Purpose

This repository creates a Home Assistant add-on that wraps the [twc3teslamate](https://github.com/Haveacry/twc3teslamate) Docker container. The upstream project simulates a Tesla Wall Connector Gen3 API by fetching vehicle data from Teslamate via MQTT, enabling integrations like evcc to work with Tesla mobile chargers.

## Home Assistant Add-on Structure

A HA add-on requires this structure in a subdirectory (e.g., `twc3teslamate/`):
- `config.yaml` - Add-on metadata, configuration schema, and options
- `Dockerfile` - Must use HA base images (`ghcr.io/home-assistant/{arch}-base`)
- `run.sh` - Entrypoint script that reads config from `/data/options.json`

Repository root needs:
- `repository.yaml` - Repository metadata for HACS

## Configuration Options to Expose

From upstream twc3teslamate, these environment variables should become HA config options:
- `MQTT_HOST` (required) - Can default to Home Assistant's MQTT broker
- `MQTT_PORT` (default: 1883)
- `MQTT_USERNAME` / `MQTT_PASSWORD` (optional)
- `TESLAMATE_CAR_ID` (default: 1)
- `TESLAMATE_GEO_HOME` (default: "Home")
- `TESLAMATE_NAMESPACE` (optional)

## Build and Test Commands

```bash
# Build the add-on locally
docker build -t local/twc3teslamate-addon ./twc3teslamate

# Test the container
docker run --rm -p 8080:80 \
  -e MQTT_HOST=<broker_ip> \
  local/twc3teslamate-addon

# Validate config.yaml schema
ha addons validate
```

## Upstream API Endpoint

The wrapped service exposes `/api/1/vitals` which returns TWC3-formatted charging data.
