class AnimalSerializer
  include JSONAPI::Serializer
  attributes :name, :age, :breed, :color, :chip_number, :species_id, :client_id
end
