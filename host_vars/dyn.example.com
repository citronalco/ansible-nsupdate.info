# All variables must be set - except when stated as "optional"

nsupdate:
  # Randomly generated django secret key, used internally by Django for security stuff
  # You may create one with this command line:
  #    python3 -c "import secrets; print(secrets.token_urlsafe())"
  secret_key: SECRETKEY

  # Display service contact mail address
  service_contact: "contact@example.com"
  # Sender mail address (optional, default: nsupdate.service_contact)
  default_from_email: "noreply@example.com"

  # Admin account
  django_superuser:
    username: superuser
    password: superpass
    email: boss@example.com

  # Enable user registration (optional, default: false)
  registration_open: true

  # Domain
  basedomain:
    # this server's host name = your first dyndns domain
    name: dyn.example.com
    # make this domain immediately available for all users (optional, default: false)
    public: true

    secondary_ns:
      # Optional: if you have a secondary DNS server (highly recommended!) enter its hostname here
      # (there are free secondary DNS server services, e.g. buddyns.com)
      #hostname: ljhgl2389ukjdhkwhd239uesadswd.free.ns.buddyns.com
      # Optional: set your secondary DNS server's IPv4 and IPv6 addresses.
      # This limits allowed DNS zone transfers in Bind9 to this server, and nsupdate will try to update this server immediately on its own
      #ipv4: 123.456.123.456
      #ipv6: "abcd:000::1234:5678"


# Set a username and password for PostgreSQL database
postgresql:
  username: nsupdate
  password: TOPSECRET


# Configure SMTP server - This can be anything, from GMX to Gmail
# Be aware that most free mail providers will only allow you to send mails with a fixed sender email address
# In that case make sure to set this as "default_from_email" above
mail:
  # Name of SMTP server
  smtp: "mail.example.com"
  # Username and password
  user: "user123"
  pw: "myMailPwd123"
