#!/bin/bash

read -p "name of service you want for status:" name
systemctl status ${name}
