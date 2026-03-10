# sysadmin-toolkit

Scripts to automate some common sysadmin tasks. Built on a local Ubuntu VM with Vagrant as part of a DevOps learning project.

## requirements

- Vagrant + VMware Fusion
- Ubuntu 22.04
- Python 3

## usage

**user_manager.sh** create/delete users and assign groups
```bash
sudo ./user_manager.sh create alice
sudo ./user_manager.sh create alice sudo
sudo ./user_manager.sh delete alice
```

**log_cleaner.py** archives log files older than 30 days
```bash
python3 log_cleaner.py /var/log/app-test /var/log/app-test/archive
```

**service_monitor.sh** checks if a service is running, logs an alert if it's down
```bash
sudo ./service_monitor.sh nginx
# alerts are written to /var/log/service_monitor.log
```

## setup
make sure you have the VMware Vagrant plugin installed first:
```bash
vagrant plugin install vagrant-vmware-desktop
vagrant up
vagrant ssh
cd /vagrant
```
