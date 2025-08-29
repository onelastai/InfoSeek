class ScansController < ApplicationController
  def create
    scan_type = params[:scan_type]
    target = params[:target]

    result = case scan_type
             when 'port'
               Netscope::PortScanner.new(target).scan
             when 'whois'
               Netscope::WhoisLookup.new(target).lookup
             when 'dns'
               Netscope::DnsEnum.new(target).enumerate
             when 'ssl'
               Netscope::SslAnalyzer.new(target).analyze
             when 'vuln'
               Netscope::VulnScanner.new(target).scan
             else
               { error: 'Invalid scan type' }
             end

    scan = ScanResult.create(scan_type: scan_type, target: target, data: result)

    render json: scan
  end
end
