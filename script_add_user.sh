#!/bin/bash

read -p "name of user you want to add ?: " name
sudo adduser ${name}

