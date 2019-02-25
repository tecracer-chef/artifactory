log_level                :info
log_location             STDOUT
node_name                'pschaumburg'
client_key               "#{ENV['PWD']}/.travis/publish-key.pem"
validation_client_name   'chef-validator'
validation_key           "#{ENV['PWD']}/.travis/publish-key.pem"
