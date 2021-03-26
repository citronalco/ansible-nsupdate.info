# Requirements:
# - Server has a fixed IP address (IPv4+IPv6)
# - DNS has A and AAAA records for this server (e.g. dyn.example.com A 12.34.56.78, dyn.example.com AAAA 2a03:1000:53:123::12)
# - DNS has a NS record set for dyn.example.com pointing to this server (e.g. dyn.example.com NS dyn.example.com)
# - If you use a secondary NS add a seconds NS entry to your DNS pointing to that server (e.g. dyn.example.com NS ljhgl2389ukjdhkwhd239uesadswd.free.ns.buddyns.com)

nsupdate:
  # Randomly generated django secret key
  # Used internally by Django for security stuff
  secret_key: SECRETKEY

  # Display service contact mail address
  service_contact: "contact@example.com"
  # Sender mail address (default: nsupdate.service_contact)
  default_from_email: "noreply@example.com"

  # Admin account
  django_superuser:
    username: superuser
    password: superpass
    email: root@geierb.de

  # Enable user registration (default: false)
  registration_open: true

  # Domain
  basedomain:
    # this server's host name = your first dyndns domain
    name: dyn.example.com
    # free to use for all users (default: false)
    public: true
    # available for users (default: false)
    available: true

    secondary_ns:
      # Optional: if you have a secondary DNS server (highly recommended!) enter its hostname here
      # (there are free secondary DNS server services, e.g. buddyns.com)
      #hostname: ljhgl2389ukjdhkwhd239uesadswd.free.ns.buddyns.com
      # Optional: set your secondary DNS server's IP addresses.
      # This limits allowed DNS zone transfers in Bind9 to this server, and nsupdate will try to update this server immediately on its own
      #ipv4: 123.456.123.456
      #ipv6: "abcd:000::1234:5678"


# Set username and password for PostgreSQL
postgresql:
  username: nsupdate
  password: TOPSECRET


# Configure SMTP server
mail:
  # Name of SMTP server
  smtp: "mail.example.com"
  # Username and password
  user: "user123"
  pw: "myMailPwd123"
