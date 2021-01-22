#!/bin/bash

read -p "name of user from groups: " user
groups ${user} | cut -d ':' -f 2

