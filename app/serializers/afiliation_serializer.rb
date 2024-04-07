class AfiliationSerializer
  include JSONAPI::Serializer
  attributes :id, :vet_id, :client_id, :speciality
end
