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

        def get_disk(id = nil, fields = DISK_QUERY_FIELDS_STR)
            return get_instance('disk', fields, id)
        end
    end
end
