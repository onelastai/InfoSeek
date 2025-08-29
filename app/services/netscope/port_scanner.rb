require 'socket'
require 'timeout'

module Netscope
  class PortScanner
    def initialize(host, ports = (1..1024))
      @host = host
      @ports = ports
    end

    def scan
      open_ports = []
      @ports.each do |port|
        begin
          Timeout.timeout(0.5) do
            socket = TCPSocket.new(@host, port)
            socket.close
            open_ports << port
          end
        rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH, Timeout::Error
          next
        end
      end
      { host: @host, open_ports: open_ports }
    end
  end
end
