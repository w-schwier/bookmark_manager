# Adds tag to links for ease of searching
class Tag
  include DataMapper::Resource
  has n, :links, through: Resource

  property :id, Serial
  property :name, String
end
