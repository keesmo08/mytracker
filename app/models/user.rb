class User < ActiveRecord::Base
  
  has_many :calls
  has_many :drops
  has_many :accounts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
