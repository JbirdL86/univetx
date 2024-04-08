class VetSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :type, :name, :last_name, :speciality, :vet_id, :address, :country, :city
  has_many :afiliations, foreign_key: :vet_id, primary_key: :vet_id
  has_many :clients, through: :afiliations
end


