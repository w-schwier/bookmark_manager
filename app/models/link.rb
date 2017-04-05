# Display links
require 'data_mapper'
require 'dm-postgres-adapter'

class Link
include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String

end

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV["RACK_ENV"]}") # Set up a connection to the database
DataMapper.finalize # Check everything we wrote in the model (class) was OK
DataMapper.auto_upgrade! # Let's build any new columns or tables added
