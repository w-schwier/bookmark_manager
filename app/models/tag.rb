# Adds tag to links for ease of searching
class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  has n, :links, through: Resource
end
