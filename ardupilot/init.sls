{%- if pillar.ardupilot is defined %}
include:
{%- if pillar.ardupilot.vehicle is defined %}
- ardupilot.vehicle
{%- endif %}
{%- endif %}
