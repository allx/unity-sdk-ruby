module UNITY_SDK
    module BasicSystemInfoHelper
        BASIC_SYSTEM_INFO_FIELDS = [
            'id',
            'model',
            'name',
            'softwareVersion',
            'apiVersion',
            'earliestApiVersion',
        ]
        BASIC_SYSTEM_INFO_FIELDS_STR = BASIC_SYSTEM_INFO_FIELDS.join(',')

        def get_basic_system_info(id = nil, fields = BASIC_SYSTEM_INFO_FIELDS_STR)
            return get_instance('basicSystemInfo', fields, id)
        end
    end
end
