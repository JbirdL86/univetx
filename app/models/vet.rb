class Vet < User
    has_many :afiliations, foreign_key: :vet_id, primary_key: :vet_id
    has_many :clients, through: :afiliations

end