class ClientSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :type, :name, :last_name, :client_id, :address, :country, :city
  has_many :afiliations, foreign_key: :client_id
  has_many :vets, through: :afiliations
end


