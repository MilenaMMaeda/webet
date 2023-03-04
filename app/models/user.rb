class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_bets
  has_many :bets, through: :user_bets
  has_one :wallet
  has_one_attached :photo

  after_create :create_wallet

  def create_wallet
    build_wallet(balance: 0)
    save
  end
end
