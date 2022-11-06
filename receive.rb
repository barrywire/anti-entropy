require 'socket'
require 'ipaddr'

MULTICAST_ADDR = '224.0.0.1'
BIND_ADDR = '0.0.0.0'
PORT = 5000

socket = UDPSocket.open
membership = IPAddr.new(MULTICAST_ADDR).hton + IPAddr.new(BIND_ADDR).hton

socket.setsockopt(:IPPROTO_IP, :IP_ADD_MEMBERSHIP, membership)
socket.setsockopt(:SOL_SOCKET, :SO_REUSEADDR, 1)

socket.bind(BIND_ADDR, PORT)

loop do
    message, _ = socket.recvfrom(255)
    puts message
    # puts socket.recvfrom(1024)
end
