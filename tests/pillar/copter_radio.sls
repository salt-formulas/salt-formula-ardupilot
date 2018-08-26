ardupilot:
  copter:
    enabled: true
    module:
      # GPS connected to UART5
      gps:
        serial_port: serial3 # B
        device: /dev/ttyO5
      #MAVLink via radio
      mavlink:
        serial_port: serial1 # C
        device: /dev/ttyO4

