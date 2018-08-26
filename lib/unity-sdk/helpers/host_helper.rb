module UNITY_SDK
    module HostHelper
        HOST_QUERY_FIELDS = [
            'id',
            'health',
            'name',
            'description',
            'type',
            'osType',
            'hostUUID',
            'hostPushedUUID',
            'hostPolledUUID',
            'lastPollTime',
            'autoManageType',
            'registrationType',
            'hostContainer',
            'fcHostInitiators',
            'iscsiHostInitiators',
            'hostIPPorts',
            'storageResources',
            'hostLUNs',
            'datastores',
            'nfsShareAccesses',
            'hostVVolDatastore',
            'vms'
        ]
        HOST_QUERY_FIELDS_STR = HOST_QUERY_FIELDS.join(',')

        def get_hosts
            response = rest_get('/api/types/host/instances/')
            entries = response_handler(response)['entries']

            hosts = Array.new
            entries.each do |entry|
                hosts.push(entry['content']['id'])
            end
            hosts
        end

        def get_host(id)
            response = rest_get("/api/instances/host/#{id}?fields=#{HOST_QUERY_FIELDS_STR}")
            response_handler(response)['content']
        end



    end
end
