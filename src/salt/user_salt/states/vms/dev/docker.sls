{# FIXME: refactor, use better targeting in tops then delete this file (see #79) #}
docker-service-enabled-on-{{ pillar.dev.name }}:
  qvm.service:
    - name: {{ pillar.dev.name }}
    - enable:
      - docker
