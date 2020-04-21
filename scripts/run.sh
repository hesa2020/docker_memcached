#!/bin/bash

echo "Starting Memcached..."
memcached -u memcached -l 0.0.0.0 -p 11211 -m 4096 -c 2048 -t 4 $@
echo "Started Memcached..."