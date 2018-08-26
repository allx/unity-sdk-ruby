Dir[File.join(File.dirname(__FILE__), './*.rb')].each { |file| require file }

module UNITY_SDK
    module InstanceHelper

        def apply_value_map(json, map)
            map_key = map.keys
            json.each do |key, val|
                if map_key.find_index(key)
                    if val.respond_to?(:key?)
                        apply_value_map(val, map[key])
                    else
                        json[key] = map[key][val]
                    end
                end
            end
            json
        end

        def get_instance(type, fields, id = nil, value_map = nil)
            if id
                response = rest_get("/api/instances/#{type}/#{id}?fields=#{fields}")
                json = response_handler(response)['content']
                apply_value_map(json, value_map) if value_map
                return json
            else
                response = rest_get("/api/types/#{type}/instances?fields=#{fields}")
                entries = response_handler(response)['entries']

                items = Array.new
                entries.each do |entry|
                    json = entry['content']
                    apply_value_map(json, value_map) if value_map
                    items.push(json)
                end
                return items 
            end
        end

        include LUNHelper
        include DiskHelper
        include HostHelper
        include HostLUNHelper
        include SnmpHelper
        include DnsHelper
        include NtpHelper
        include BasicSystemInfoHelper

    end
end

