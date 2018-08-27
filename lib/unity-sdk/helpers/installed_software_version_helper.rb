module UNITY_SDK
    module SwVersionHelper
        SW_VERSION_FIELDS = [
            'id',
            'version',
            'revision',
            'releaseDate',
            'languages',
            'hotFixes',
            'packageVersions'
        ]
        
        SW_VERSION_FIELDS_STR = SW_VERSION_FIELDS.join(',')

        def get_sw_version(id = nil, fields = SW_VERSION_FIELDS_STR)
            return get_instance('installedSoftwareVersion', fields, id)
        end
    end
end
