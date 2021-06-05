; Configuration file for Duet WiFi (firmware version 2.03)
; executed by the firmware on start-up

; General preferences
G90                                                ; send absolute coordinates...
M83                                                ; ...but relative extruder moves
M550 P"ender 5 plus"                               ; set printer name

; Network
M552 S1 
M552 P0.0.0.0 S1                                   ; enable network and acquire dynamic address via DHCP
M586 P0 S1                                         ; enable HTTP
M586 P1 S0                                         ; disable FTP
M586 P2 S1                                         ; enable Telnet

; Drives
M569 P0 S0                                         ; physical drive 0 goes backwards
M569 P1 S1                                         ; physical drive 1 goes forward
M569 P2 S0                                         ; physical drive 2 goes backwards
M569 P3 S0                                         ; physical drive 3 goes backwards
M569 P4 S0                                         ; physical drive 4 goes backwards
M584 X0 Y1 Z2:4 E3                                 ; set drive mapping
M671 X-195:195 Y0:0 S0.5                           ; lead-screws at left (connected to Z) and right (connected to E1) of X axis
M350 X16 Y16 Z16 E16 I1                            ; default to x16 with interpolation
M92 X160 Y160 Z1600.00 E260                        ; set steps per mm
M350 Z256 E128 I0                                  ; re-calculate microstepping for Z(1.8/TR8x2) and E(0.9) motors
M201 X500.00 Y500.00 Z100.00 E5000.00              ; set maximum accelerations. TODO: adjust for M204
M203 X9000.00 Y9000.00 Z1200.00 E6000.00           ; set maximum speeds(6000 = 100mm/s)
M566 X250 Y250 Z60.00 E3000.00 P1                  ; set maximum jerk
M204 P500 T1500                                    ; set print and travel accelerations
M906 X1600 Y1600 Z800 E720 I30                     ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                            ; set idle timeout
 
; Axis Limits
M208 X-175 Y-175 Z0 S1                             ; set axis minima
M208 X175 Y175 Z400 S0                             ; set axis maxima

; End-stops
M574 Z0                                            ; disabled end stop for z
M574 X2 Y2 S1                                      ; set active high end-stops

; Filament Sensor
M591 D0 P1 S1 C3

; Z-Probe
M307 H3 A-1 C-1 D-1                                ; disable heater on PWM channel for BLTouch
M558 P9 H5 F120 T6000                              ; set Z probe type to bltouch and the dive height + speeds
G31 P500 X1.300 Y-52.500 Z1.697                    ; set Z probe trigger value, offset and trigger height
M557 X-168.7:171.3 Y-166.25:113.75 S20             ; define mesh grid

; Heaters
M307 H0 B0 S1.00                                   ; disable bang-bang mode for the bed heater and set PWM limit
M305 P0 T100000 B4138 R4700                        ; set thermistor + ADC parameters for heater 0
M143 H0 S120                                       ; set temperature limit for heater 0 to 120C
M305 P1 T100000 B4138 R4700                        ; set thermistor + ADC parameters for heater 1
M143 H1 S285                                       ; set temperature limit for heater 1 to 280C

; Fans
M106 P1 C"part-cooling" S0.65 I0 H-1               ; set fan 0 name, value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P0 C"hend-cooling" S0.65 I0 H1 T30            ; set fan 1 name, value, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P2 S1 H100:101:102 T45                        ; set fan 0 name, value, PWM signal inversion and frequency. Thermostatic control is turned on

; Tools
M563 P0 D0 H1 F0                                   ; define tool 0
G10 P0 X0 Y0 Z0                                    ; set tool 0 axis offsets
G10 P0 R0 S0                                       ; set initial tool 0 active and standby temperatures to 0C

; Custom settings
;M593 F50                                          ; cancel ringing at 50Hz
M572 D0 S0.081                                     ; set pressure advance for PLA

; Miscellaneous
M911 S12 R20 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000" ; set voltage thresholds and actions to run on power loss
M501

