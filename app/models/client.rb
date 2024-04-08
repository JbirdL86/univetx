class Client < User
    has_many :afiliations, foreign_key: :client_id
    has_many :vets, through: :afiliations

end