module UNITY_SDK
    module LUNQueryHelper
        LUN_QUERY_FIELDS = [
            'id',
            'health',
            'name',
            'description',
            'type',
            'sizeTotal',
            'sizeUsed',
            'sizeAllocated',
            'perTierSizeUsed',
            'isThinEnabled',
            'storageResource',
            'pool',
            'wwn',
            'tieringPolicy',
            'defaultNode',
            'isReplicationDestination',
            'currentNode',
            'snapSchedule',
            'isSnapSchedulePaused',
            'ioLimitPolicy',
            'metadataSize',
            'metadataSizeAllocated',
            'snapWwn',
            'snapsSize',
            'snapsSizeAllocated',
            'hostAccess',
            'snapCount'
        ]
        LUN_QUERY_FIELDS_STR = LUN_QUERY_FIELDS.join(',')

        def get_luns
            response = rest_get('/api/types/lun/instances/')
            entries = response_handler(response)['entries']

            luns = Array.new
            entries.each do |entry|
                luns.push(entry['content']['id'])
            end
            luns
        end

        def get_lun(id)
            response = rest_get("/api/instances/lun/#{id}?fields=#{LUN_QUERY_FIELDS_STR}")
            response_handler(response)['content']
        end

    end
end
