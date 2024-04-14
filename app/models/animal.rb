class Animal < ApplicationRecord
    belongs_to :client
    belongs_to :species
end
