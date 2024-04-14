class Species < ApplicationRecord
    has_many :animals, foreign_key: :id
end
