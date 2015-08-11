#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

configure

# Fix for error "INIT: Id "TO" respawning too fast: disabled for 5 minutes"
delete system console device ttyS0

# Commands here
set system host-name router
set system gateway-address 10.0.2.2
set system name-server 192.0.2.2
set service dns forwarding listen-on eth2
set service dns forwarding name-server 192.0.2.2
set service ssh listen-address 0.0.0.0

set interfaces ethernet eth0 address dhcp
set interfaces ethernet eth1 address 192.0.2.254/24
set interfaces ethernet eth2 address 172.16.255.254/16

commit
save
