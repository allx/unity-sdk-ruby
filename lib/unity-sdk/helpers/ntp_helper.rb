module UNITY_SDK
    module NtpHelper
        NTP_QUERY_FIELDS = [
            'id',
            'addresses'
        ]
        NTP_QUERY_FIELDS_STR = NTP_QUERY_FIELDS.join(',')

        def get_ntp(id = nil, fields = NTP_QUERY_FIELDS_STR)
            return get_instance('ntpServer', fields, id)
        end
    end
end
