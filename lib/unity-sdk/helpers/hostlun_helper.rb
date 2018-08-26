module UNITY_SDK
    module HostLUNHelper
        HOSTLUN_QUERY_FIELDS = [
            'id',
            'host',
            'type',
            'hlu',
            'lun',
            'snap',
            'isReadOnly'
        ]
        HOSTLUN_QUERY_FIELDS_STR = HOSTLUN_QUERY_FIELDS.join(',')

        def get_hostluns
            response = rest_get('/api/types/hostLUN/instances/')
            entries = response_handler(response)['entries']

            hostluns = Array.new
            entries.each do |entry|
                hostluns.push(entry['content']['id'])
            end
            hostluns
        end

        def get_hostlun(id)
            response = rest_get("/api/instances/hostLUN/#{id}?fields=#{HOSTLUN_QUERY_FIELDS_STR}")
            response_handler(response)['content']
        end

    end
end
