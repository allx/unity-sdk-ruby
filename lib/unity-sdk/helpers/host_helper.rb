require_relative 'enumerations'

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

        HOST_JSON_MAPS = {
            'type' => Host_Type_Enum,
            'health' => {'value' => Health_Enum},
            'autoManageType' => Host_Manage_Enum,
            'registrationType' => Host_Registration_Type_Enum
        }

        def get_host(id = nil, fields = HOST_QUERY_FIELDS_STR)
            return get_instance('host', fields, id, HOST_JSON_MAPS)
        end
    end
end
