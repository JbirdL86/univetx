FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    expired_at { "2025-08-11 11:23:02" }
  end
end
