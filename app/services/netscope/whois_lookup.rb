require 'whois'

module Netscope
  class WhoisLookup
    def initialize(domain)
      @domain = domain
      @client = Whois::Client.new
    end

    def lookup
      record = @client.lookup(@domain)
      {
        domain: @domain,
        registrar: record.registrar.name rescue nil,
        created_on: record.created_on,
        updated_on: record.updated_on,
        expires_on: record.expires_on,
        nameservers: record.nameservers.map(&:name)
      }
    rescue => e
      { error: e.message }
    end
  end
end
