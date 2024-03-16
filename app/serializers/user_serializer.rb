class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :type
end
