require_relative './lib/unity-sdk/version'

Gem::Specification.new do |spec|
  spec.name          = 'unity-sdk'
  spec.version       = UNITY_SDK::VERSION
  spec.authors       = ['Alec Li']
  spec.email         = ['alec.li@nokia.com']
  spec.summary       = 'Gem to interact with EMC Unity API'
  spec.homepage      = 'https://github.com/allx/unity-sdk-ruby'
  spec.files         = ["lib/unity-sdk/version.rb", "lib/unity-sdk/client.rb", "lib/unity-sdk.rb", "lib/unity-sdk/helpers/lun_query_helper.rb"]
  spec.license       = 'MIT'

end
