require 'openssl'
require 'socket'

module Netscope
  class SslAnalyzer
    def initialize(host, port = 443)
      @host = host
      @port = port
    end

    def analyze
      tcp_client = TCPSocket.new(@host, @port)
      ssl_client = OpenSSL::SSL::SSLSocket.new(tcp_client)
      ssl_client.hostname = @host
      ssl_client.connect

      cert = ssl_client.peer_cert

      {
        subject: cert.subject.to_s,
        issuer: cert.issuer.to_s,
        not_before: cert.not_before,
        not_after: cert.not_after,
        expired: Time.now > cert.not_after
      }
    rescue => e
      { error: e.message }
    ensure
      ssl_client&.close
      tcp_client&.close
    end
  end
end
