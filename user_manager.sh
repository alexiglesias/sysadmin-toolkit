#!/bin/bash


# simple user management script
# usage: ./user_manager.sh [create|delete] username [group]


ACTION=$1
USERNAME=$2
GROUP=$3


if [ -z "$ACTION" ] || [ -z "$USERNAME" ]; then
  echo "usage: $0 [create|delete] username [group]"
  exit 1
fi


create_user() {
  if id "$USERNAME" &>/dev/null; then
    echo "user $USERNAME already exists"
    exit 1
  fi


  useradd -m "$USERNAME"
  echo "user $USERNAME created"


  # assign group if provided
  if [ -n "$GROUP" ]; then
    usermod -aG "$GROUP" "$USERNAME"
    echo "added $USERNAME to group $GROUP"
  fi
}


delete_user() {
  if ! id "$USERNAME" &>/dev/null; then
    echo "user $USERNAME does not exist"
    exit 1
  fi


  userdel -r "$USERNAME"
  echo "user $USERNAME deleted"
}


case "$ACTION" in
  create) create_user ;;
  delete) delete_user ;;
  *)
    echo "unknown action: $ACTION"
    echo "usage: $0 [create|delete] username [group]"
    exit 1
    ;;
esac
