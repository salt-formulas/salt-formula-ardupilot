ardupilot:
  copter:
    enabled: true
    module:
      # GPS connected to UART5
      gps:
        serial_port: serial3 # B
        device: /dev/ttyO5
      #MAVLink groundstation
      mavlink:
        serial_port: serial1 # C
        proto: udp
        host: 10.10.10.1
        port: 14550

