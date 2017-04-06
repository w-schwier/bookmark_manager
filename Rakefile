require_relative './app/data_mapper_setup'

task default: %w[test]

task :test do
  DataMapper.auto_upgrade!
end
