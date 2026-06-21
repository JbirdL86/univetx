require 'faker'
require 'factory_bot_rails'

module UserHelpers

  def create_user
    FactoryBot.create(:user, 
            email: Faker::Internet.email, 
            password: Faker::Internet.password,
            type: 'Client',
            name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            speciality: "",
            address: Faker::Address.full_address,
            country: Faker::Address.country,
            client_id: Faker::Number.number(digits: 5),
            city: Faker::Address.city
        )
  end

    def build_user
    FactoryBot.build(:user, 
            email: Faker::Internet.email, 
            password: Faker::Internet.password,
            type: 'client',
            name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            speciality: "",
            address: Faker::Address.full_address,
            country: Faker::Address.country,
            client_id: Faker::Number.number(digits: 5),
            city: Faker::Address.city
        )
  end

end