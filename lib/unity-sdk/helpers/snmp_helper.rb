module UNITY_SDK
    module SnmpHelper
        SNMP_QUERY_FIELDS = [
            'id',
            'address',
            'version',
            'username',
            'authProto',
            'privacyProto'
        ]
        SNMP_QUERY_FIELDS_STR = SNMP_QUERY_FIELDS.join(',')

        def get_snmp(id = nil, fields = SNMP_QUERY_FIELDS_STR)
            return get_instance('alertConfigSNMPTarget', fields, id)
        end
    end
end
