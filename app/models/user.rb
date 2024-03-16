class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self


  def as_json(options={})
    
    super(options.merge({ methods: :type }))
  end
  
  def vet?
    type == 'vet'
  end
  
  def client?
    type == 'seller'
  end
end
