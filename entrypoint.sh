#!/bin/bash

# Run DB migrations
pufferpanel database migrate

# Create the admin user (ignore error if user exists)
pufferpanel user add --admin --username muin12 --password muin12 --email muingaming017@gmail.com || true

# Start the PufferPanel service
pufferpanel serve
