# Install nsupdate.info on Debian with Ansible

This role installs everything you need to run your own dynamic DNS service:
* nsupdate.info as main service
* PostgreSQL as database
* Nginx with uwsgi as webserver
* Bind9 for DNS
* certbot for TLS certificates
* Postfix as local mail relay

I found the installation of nsupdate.info pretty hard and the documentation too brief, so I used Ansible to document my experiences. Study, share, improve :)

#### Requirements:
* Server with Debian 10 or 11 and fixed IPv4+IPv6 address (e.g. `12.34.56.78` and `2a03:1000:53:123::12`)
* A domain (e.g. `example.com`)
* Some DNS entries: If you own the domain "example.com" and want to run a dynamic DNS service on "dyn.example.com" then set this entries in the nameserver of "example.com":
  * A and AAAA records for this server:
    * `dyn.example.com A 12.34.56.78`
    * `dyn.example.com AAAA 2a03:1000:53:123::12`
  * NS record to this server:
    * `dyn.example.com NS dyn.example.com`
  * If you use a secondary DNS server then additionally a NS rercord pointing to that server:
    * `dyn.example.com NS ljhgl2389ukjdhkwhd239uesadswd.free.ns.buddyns.com`

##### Configuration:
See `host_vars/dyn.example.com`

