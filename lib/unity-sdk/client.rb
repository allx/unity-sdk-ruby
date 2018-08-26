require 'uri'
require 'json'
require 'logger'
require 'openssl'
require 'net/http'

require_relative 'helpers/instance_helper'

module UNITY_SDK
    class Client
        def initialize(options = {})
            options = Hash[options.map { |k, v|  [k.to_sym, v] }]
            @log_level = options[:log_level] || :warn
            @logger = options[:logger] || Logger.new(STDOUT)
            @logger.level = @logger.class.const_get(@log_level.upcase)

            @host = options[:host] || ENV['UNITY_HOST']
            raise "missing host" unless @host
            @user = options[:user] || ENV['UNITY_USER']
            raise "missing user" unless @user
            @password = options[:password] || ENV['UNITY_PASSWORD']
            raise "missing password" unless @password

            @host = 'https://' + @host unless @host.start_with?('http://', 'https://')

            @options = Hash.new
            @options['Accept'] ||= 'application/json'
            @options['Content-Type'] ||= 'application/json'
            @options['X-EMC-REST-CLIENT'] ||= 'true'
        end

        include InstanceHelper

        private

        def response_handler(response)
            case response
            when Net::HTTPSuccess then
                begin
                    return JSON.parse(response.body)
                rescue JSON::ParserError => e
                    @logger.warn "cannot parse JSON response:\n #{e}"
                    return response.body
                end
            else
                @logger.warn "cannot handle response (#{response.code}):\n#{response.body}"
            end
        end

        def rest_get(path)

            uri = URI.parse(URI.escape("#{@host}#{path}"))
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            cookie = nil 

            redirect_remain = 10
            while redirect_remain > 0 do

                redirect_remain -= 1

                request = Net::HTTP::Get.new(uri.request_uri)
                @options.each do |key, val|
                    request[key] = val 
                end 
                request['Cookie'] = cookie if cookie
                request.basic_auth(@user, @password)

                @logger.debug("requesting #{uri}")
                response = http.request(request)

                case response
                when Net::HTTPRedirection then
                    uri = URI.parse(response.header['location'])
                    cookie = response.header['set-cookie'] if response.header.key?('set-cookie')
                else
                    return response
                end

            end
            @logger.warn("#{path} exceeded max redirection")
            nil
        end
    end
end

