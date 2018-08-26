{%- if pillar.ardupilot is defined %}
include:
{%- if pillar.ardupilot.copter is defined %}
- ardupilot.copter
{%- endif %}
{%- endif %}
