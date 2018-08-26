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

        def get_hostlun(id = nil, fields = HOSTLUN_QUERY_FIELDS_STR)
            return get_instance('hostLUN', fields, id)
        end
    end
end
