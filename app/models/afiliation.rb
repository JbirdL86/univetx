class Afiliation < ApplicationRecord
    belongs_to :vet
    belongs_to :client, foreign_key: :client_id
end
