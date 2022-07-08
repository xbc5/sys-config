{# TODO: docker group (sudo-less); enable unit; docker config (host net) #}
docker-ce-repo-installed:
  cmd.run:
    - require:
      - dnf-plugins-core-installed
    - creates: /etc/yum.repos.d/docker-ce.repo
    - name: |
        dnf config-manager --add-repo \
          https://download.docker.com/linux/fedora/docker-ce.repo \
          && dnf config-manager --set-enabled docker-ce-stable

docker-ce-installed:
  pkg.installed:
    - require:
      - docker-ce-repo-installed
    - pkgs:
      - docker-ce
      - docker-ce-cli
      - containerd.io
      - docker-compose-plugin

{# control this with qvm-service, thus you must enable it in the template #}
docker-service-enabled-in-template:
  service.enabled:
    - require:
      - docker-ce-installed
    - name: docker

{# this is so bind-dirs works - the docker dir doesn't exist early in boot #}
dummy-docker-data-dir-created:
  file.directory:
    - name: {{ pillar.paths.docker.data }}
    - mode: 710 # same as official docker
    - user: root
    - group: root

    
