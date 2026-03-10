#!/bin/bash


# checks if a service is running and alerts if it's down
# usage: ./service_monitor.bash <service_name>


SERVICE=$1


if [ -z "$SERVICE" ]; then
  echo "usage: $0 <service_name>"
  exit 1
fi


check_service() {
  if systemctl is-active --quiet "$SERVICE"; then
    echo "[$SERVICE] is running"
  else
    echo "[$SERVICE] is DOWN - $(date)"
    alert
  fi
}


alert() {
  # TODO: replace with real email or slack webhook later
  echo "ALERT: $SERVICE is not running - $(date)" >> /var/log/service_monitor.log
}


check_service

