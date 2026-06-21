class Vet < User
    has_many :afiliations
    has_many :clients, through: :afiliations

end