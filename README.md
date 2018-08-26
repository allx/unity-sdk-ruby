# Ruby SDK for EMC Unity

Dell EMC Unity REST API Ruby SDK.

# Examples

```ruby
require 'unity-sdk'
client = UNITY_SDK::Client.new(
        host: 'https://unity.example.com',
        user: 'admin',
        password: 'password'
        )

disks = client.get_disk
lun12 = client.get_lun('sv_12')

```

## License

Licensed under the MIT License.

