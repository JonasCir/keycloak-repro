#!/bin/bash

cat << EOF > /usr/local/apache2/conf.d/000_${SORMAS_SERVER_URL}.conf
<VirtualHost *:80>
    ServerName ${SORMAS_SERVER_URL}


         ErrorLog /var/log/apache2/error.log
         LogLevel warn
         LogFormat "%h %l %u %t \"%r\" %>s %b _%D_ \"%{User}i\"  \"%{Connection}i\"  \"%{Referer}i\" \"%{User-agent}i\"" combined_ext
         CustomLog /var/log/apache2/access.log combined_ext


         ProxyRequests Off
         ProxyPreserveHost On

         ProxyPass /keycloak http://local-keycloak:8080 connectiontimeout=5 timeout=600
         ProxyPassReverse /keycloak http://local-keycloak:8080



</VirtualHost>
EOF

exec $@
