require_relative 'enumerations'

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

        DISK_JSON_MAPS = {
            'health' => {'value' => Health_Enum},
            'tierType' => Tier_Type_Enum,
            'diskTechnology' => Disk_Technology_Enum
        }

        def get_disk(id = nil, fields = DISK_QUERY_FIELDS_STR)
            return get_instance('disk', fields, id, DISK_JSON_MAPS)
        end
    end
end
