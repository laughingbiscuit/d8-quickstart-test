#!/bin/bash
composer quick-start
sleep 5
nginx
tail -f /dev/null
