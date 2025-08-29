require 'resolv'

module Netscope
  class DnsEnum
    def initialize(domain)
      @domain = domain
    end

    def enumerate
      results = {}

      begin
        results[:a_records] = Resolv::DNS.open do |dns|
          dns.getresources(@domain, Resolv::DNS::Resource::IN::A).map { |r| r.address.to_s }
        end

        results[:mx_records] = Resolv::DNS.open do |dns|
          dns.getresources(@domain, Resolv::DNS::Resource::IN::MX).map { |r| { exchange: r.exchange.to_s, preference: r.preference } }
        end

        results[:ns_records] = Resolv::DNS.open do |dns|
          dns.getresources(@domain, Resolv::DNS::Resource::IN::NS).map { |r| r.name.to_s }
        end
      rescue => e
        results[:error] = e.message
      end

      results
    end
  end
end
