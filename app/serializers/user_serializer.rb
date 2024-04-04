class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :type, :name, :last_name, :college_id, :speciality, :address, :country, :city
end
