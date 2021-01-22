#!/bin/bash

read -p "name of group you want to add ?: " name
sudo addgroup ${name}

