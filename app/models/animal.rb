class Animal < ApplicationRecord
    belongs_to :client, foreign_key: :client_id
    belongs_to :species
end
