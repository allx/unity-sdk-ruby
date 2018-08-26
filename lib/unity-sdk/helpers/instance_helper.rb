Dir[File.join(File.dirname(__FILE__), './*.rb')].each { |file| require file }

module UNITY_SDK
    module InstanceHelper
        def get_instance(type, fields, id = nil)
            if id
                response = rest_get("/api/instances/#{type}/#{id}?fields=#{fields}")
                return response_handler(response)['content']
            else
                response = rest_get("/api/types/#{type}/instances?fields=#{fields}")
                entries = response_handler(response)['entries']

                items = Array.new
                entries.each do |entry|
                    items.push(entry['content'])
                end
                return items 
            end
        end

        include LUNHelper
        include DiskHelper
        include HostHelper
        include HostLUNHelper

    end
end

