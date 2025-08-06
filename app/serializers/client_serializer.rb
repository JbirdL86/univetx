class ClientSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :type, :name, :last_name, :address, :country, :city
  
  has_many :afiliations 
  has_many :vets, through: :afiliations
  has_many :animals
end


