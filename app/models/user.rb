class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tools, dependent: :destroy
  has_many :rents, dependent: :destroy
  has_one_attached :photo
  validates :first_name, :last_name, :apartment, :email, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
