require_relative 'enumerations'

module UNITY_SDK
    module SnmpHelper
        SNMP_QUERY_FIELDS = [
            'id',
            'address',
            'version',
            'community',
            'username',
            'authProto',
            'privacyProto'
        ]
        SNMP_QUERY_FIELDS_STR = SNMP_QUERY_FIELDS.join(',')

        SNMP_JSON_MAPS = {
            'version' => SNMP_Version_Enum,
            'authProto' => SNMP_Auth_Protocol_Enum,
            'privacyProto' => SNMP_Privacy_Protocol_Enum
        }

        def get_snmp(id = nil, fields = SNMP_QUERY_FIELDS_STR)
            return get_instance('alertConfigSNMPTarget', fields, id, SNMP_JSON_MAPS)
        end
    end
end
