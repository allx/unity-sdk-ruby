module UNITY_SDK
    module DiskHelper
        DISK_QUERY_FIELDS = [
            'id',
            'health',
            'needsReplacement',
            'parent',
            'slotNumber',
            'busId',
            'name',
            'manufacturer',
            'model',
            'version',
            'emcPartNumber',
            'emcSerialNumber',
            'tierType',
            'diskGroup',
            'rpm',
            'isSED',
            'currentSpeed',
            'maxSpeed',
            'pool',
            'isInUse',
            'isFastCacheInUse',
            'size',
            'rawSize',
            'vendorSize',
            'wwn',
            'diskTechnology',
            'parentDae',
            'parentDpe',
            'bank',
            'bankSlotNumber',
            'bankSlot'
        ]
        DISK_QUERY_FIELDS_STR = DISK_QUERY_FIELDS.join(',')

        def get_disks
            response = rest_get('/api/types/disk/instances/')
            entries = response_handler(response)['entries']

            disks = Array.new
            entries.each do |entry|
                disks.push(entry['content']['id'])
            end
            disks
        end

        def get_disk(id)
            response = rest_get("/api/instances/disk/#{id}?fields=#{DISK_QUERY_FIELDS_STR}")
            response_handler(response)['content']
        end

    end
end
