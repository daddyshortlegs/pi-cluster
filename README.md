# Pi Cluster

Enabling/disabling wifi:

```
sudo apt-get update
sudo apt-get install network-manager
nmcli radio wifi off
```

Assigning IP address (temporary):

Find out device name for wired network, e.g. eth0 by using “ip a”

```
sudo ip addr add 10.0.0.1/24 dev eth0
sudo ip link set dev eth0 up
```

Netplan is the tool on Ubuntu to setup your network (permanently)

Create a netplan file on each node (in /etc/netplan):

```
network:
  version: 2
  renderer: networkd
  Ethernets:
ens3:
  dhcp4: no
  addresses:
  - 10.0.0.2/24  (the IP address you want)
  nameservers:
    addresses: [8.8.8.8, 1.1.1.1]
  routes:
    To: default
    via: 10.0.0.1
```

Then do `sudo netplan apply` on each node

Routing

Temporarily route to wifi router:
```
sudo ip route add default via 192.168.1.254
```

To temporarily enable IP forwarding on the master node:
```
sudo sysctl -w net.ipv4.ip_forward=1
```

This can be made by setting the same value in the /etc/syscl.conf file.

`sudo sysctl -p` to apply changes

To setup NAT on the master do:

```
sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
```

To make the NAT changes permanent save the iptables:

```
sudo apt update
sudo apt install iptables-persistent
```

If you make changes to iptables afterwards, you will need to save again as installing the package above will save
the current iptables.

```
sudo iptables-save > /etc/iptables/rules.v4
```

### DHCP

Install kea to get an official DHCP server. Configuration lives in /etc/kea. You can test it with:

```
sudo dhclient -v eth0
```
Kea can be started and stopped as follows:

```
sudo keactrl start/stop
```

### Multicast DNS

To simplify logging onto Pis without remembering IP addresses install `avahi-daemon`. Then you can login
with the hostname:

`ssh user@pi2.local`

### SSH

To make logging into nodes easier, generate a key, then copy it to each node:

```
ssh-keygen -t rsa -b 4096
```

That will create an id_rsa (private and public) in .ssh. Then copy it to each node:

```
ssh-copy-id pi@10.0.0.x
```

Then ssh to the nodes and you won’t need a password

Ansible
Installing

```
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
```

Setting up inventory

In `/etc/ansible/hosts` add something like:

```
[cluster]
pi1 ansible_host=10.0.0.1
pi2 ansible_host=10.0.0.2
pi3 ansible_host=10.0.0.3
pi4 ansible_host=10.0.0.4
```

Testing access

```
ansible all -m ping -u pi –ask-pass
```

To run command as root across all nodes:

```
ansible all -a “touch /etc/blah” -–ask-pass -K –become
```

To shutdown the workers nodes (as root):

```
ansible workers -a “shutdown now” -K –become
```

Running the playbook as root:

```
ansible-playbook playbook.yaml -K
```




# On master node

setup port forwarding
setup NAT
copy netplan to workers to use DHCP

