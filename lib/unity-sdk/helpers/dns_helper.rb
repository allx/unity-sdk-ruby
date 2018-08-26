module UNITY_SDK
    module DnsHelper
        DNS_QUERY_FIELDS = [
            'id',
            'domain',
            'addresses',
            'origin'
        ]
        DNS_QUERY_FIELDS_STR = DNS_QUERY_FIELDS.join(',')

        def get_dns(id = nil, fields = DNS_QUERY_FIELDS_STR)
            return get_instance('dnsServer', fields, id)
        end
    end
end
