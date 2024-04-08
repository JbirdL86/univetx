class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :type, :name, :last_name, :vet_id, :client_id, :speciality, :address, :country, :city
end
