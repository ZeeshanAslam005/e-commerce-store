class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products

  def admin?
    type == 'Admin'
  end

  def buyer?
    type == 'Buyer'
  end

  def seller?
    type == 'Seller'
  end

end
