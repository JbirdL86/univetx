class VetSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :type, :name, :last_name, :speciality, :address, :country, :city
  has_many :afiliations
  has_many :clients, through: :afiliations
end


