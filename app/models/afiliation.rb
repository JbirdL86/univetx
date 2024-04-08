class Afiliation < ApplicationRecord
    belongs_to :vet, foreign_key: :vet_id, primary_key: :vet_id
    belongs_to :client, foreign_key: :client_id
end
