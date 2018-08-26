require_relative 'enumerations'

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

        HOSTLUN_JSON_MAPS = {
            'type' => HostLUN_Type_Enum
        }

        def get_hostlun(id = nil, fields = HOSTLUN_QUERY_FIELDS_STR)
            return get_instance('hostLUN', fields, id, HOSTLUN_JSON_MAPS)
        end
    end
end
