require 'uri'
require 'json'
require 'openssl'
require 'net/http'

module UNITY_SDK
    class Client
        def initialize(options = {})
            options = Hash[options.map { |k, v|  [k.to_sym, v] }]
            @host = options[:host] || ENV['UNITY_HOST']
            @user = options[:user] || ENV['UNITY_USER']
            @password = options[:password] || ENV['UNITY_PASSWORD']

            @host = 'https://' + @host unless @host.start_with?('http://', 'https://')

            @options = Hash.new
            @options['Accept'] ||= 'application/json'
            @options['Content-Type'] ||= 'application/json'
            @options['X-EMC-REST-CLIENT'] ||= 'true'
        end

        def get_luns
            response = rest_get('/api/types/lun/instances/')
            JSON.parse(response.body)
        end

        def get_disks
            response = rest_get('/api/types/disk/instances/')
            JSON.parse(response.body)
        end

        def rest_get(path)

            uri = URI.parse(URI.escape("#{@host}#{path}"))
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            cookie = nil 

            while true do

                request = Net::HTTP::Get.new(uri.request_uri)
                @options.each do |key, val|
                    request[key] = val 
                end 
                request['Cookie'] = cookie if cookie
                request.basic_auth(@user, @password)

                response = http.request(request)

                case response
                when Net::HTTPRedirection then
                    uri = URI.parse(response.header['location'])
                    cookie = response.header['set-cookie'] if response.header.key?('set-cookie')
                else
                    break
                end

            end
            response
        end
    end
end

