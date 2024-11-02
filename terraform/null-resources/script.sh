#!/bin/bash
apt update
apt install -y unzip jq net-tools nginx
for I in {1..20}
do
  echo "Hello $I"
done