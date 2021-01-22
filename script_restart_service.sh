#!/bin/bash
read -p "name of service you want to restart" name
systemctl restart ${name}
