{%- from "ardupilot/map.jinja" import vehicle with context %}
{%- if vehicle.enabled %}

ardupilot_packages:
  pkg.installed:
  - names: {{ vehicle.pkgs }}

ardupilot_config:
  file.managed:
  - name: /etc/default/ardupilot
  - source: salt://ardupilot/files/ardupilot.default
  - template: jinja
  - user: ardupilot
  - mode: 644
  - require:
    - pkg: ardupilot_packages
  - watch_in:
    - service: ardupilot_service

ardupilot_service_script:
  file.managed:
  - name: /etc/systemd/system/ardu{{ vehicle.kind }}.service
  - source: salt://ardupilot/files/ardu{{ vehicle.kind }}.service
  - template: jinja
  - user: root
  - mode: 644
  - watch_in:
    - module: ardupilot_restart_systemd

ardupilot_service:
  service.running:
  - name: ardu{{ vehicle.kind }}
  - enable: true
  - watch:
    - module: ardupilot_restart_systemd
    - file: ardupilot_service_script

ardupilot_restart_systemd:
  module.wait:
  - name: service.systemctl_reload

{%- endif %}
