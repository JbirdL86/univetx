class Client < User
    has_many :afiliations
    has_many :vets, through: :afiliations
    has_many :animals, dependent: :destroy
end