{%- from "salt/map.jinja" import api with context %}
{%- if api.enabled %}

include:
- salt.master

salt_api_packages:
  pkg.installed
  - names: {{ api.pkgs }}
  - require:
    - pkg: salt_master_packages

salt_api_service:
  service.running:
  - name: salt-api
  - require:
    - pkg: salt_api_packages
  - watch:
    - file: /etc/salt/master

{%- endif %}