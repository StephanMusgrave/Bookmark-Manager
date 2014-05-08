
class Tag

  include Datamapper::Resource

  has n, :links, :through => Resource
  property :id,   Serial
  property :text, String

end