require 'socket'

MULTICAST_ADDR = '224.0.0.1'
PORT = 5000

socket = UDPSocket.open
socket.setsockopt(:IPPROTO_IP, :IP_MULTICAST_TTL, 1)
socket.send('Hello World', 0, MULTICAST_ADDR, PORT)
# socket.send(ARGV[0], 0, MULTICAST_ADDR, PORT)

socket.close
