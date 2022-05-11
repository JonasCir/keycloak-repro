FROM quay.io/keycloak/keycloak:18.0 as kc-builder
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:18.0
COPY --from=kc-builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak
ENV KC_HOSTNAME="sormas-docker-test.com"
ENV KEYCLOAK_ADMIN="admin"
ENV KEYCLOAK_ADMIN_PASSWORD="admin"
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--proxy=edge", "--hostname-path=keycloak", "--http-enabled=true","--hostname-admin=sormas-docker-test.com"]
