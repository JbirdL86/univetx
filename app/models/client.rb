class Client < User
    has_many :afiliations, foreign_key: :client_id
    has_many :vets, through: :afiliations
    has_many :animals, foreign_key: :client_id
end