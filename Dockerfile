from arm32v6/alpine

# Install packages
RUN apk update && apk add hostapd iw dhcp vim iptables

MAINTAINER Vincent <vincent@dasecure.com>

ENV VERSION 0.01

# Configure DHCPD
RUN touch /var/lib/dhcp/dhcpd.leases

# Configure networking
ADD interfaces /etc/network/interfaces

ADD wlanstart.sh /bin/wlanstart.sh

ENTRYPOINT [ "/bin/wlanstart.sh" ]
