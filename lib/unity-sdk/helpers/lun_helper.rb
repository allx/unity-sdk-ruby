require_relative 'enumerations'

module UNITY_SDK
    module LUNHelper
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

        LUN_JSON_MAPS = {
            'type' => LUN_Type_Enum,
            'health' => {'value' => Health_Enum},
            'defaultNode' => Node_Enum,
            'currentNode' => Node_Enum
        }

        def get_lun(id = nil, fields = LUN_QUERY_FIELDS_STR)
            return get_instance('lun', fields, id, LUN_JSON_MAPS)
        end
    end
end
