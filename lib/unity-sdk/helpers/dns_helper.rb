require_relative 'enumerations'

module UNITY_SDK
    module DnsHelper
        DNS_QUERY_FIELDS = [
            'id',
            'domain',
            'addresses',
            'origin'
        ]
        DNS_QUERY_FIELDS_STR = DNS_QUERY_FIELDS.join(',')

        DNS_JSON_MAPS = {
            'origin' => DNS_Server_Origin_Enum
        }

        def get_dns(id = nil, fields = DNS_QUERY_FIELDS_STR)
            return get_instance('dnsServer', fields, id, DNS_JSON_MAPS)
        end
    end
end
