class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :type, :name, :last_name, :speciality, :address, :country, :city
end
