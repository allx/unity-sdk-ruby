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

        def get_host(id = nil, fields = HOST_QUERY_FIELDS_STR)
            return get_instance('host', fields, id)
        end
    end
end
