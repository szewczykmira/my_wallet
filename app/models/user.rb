class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  # validation
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true

  has_many :expenses

end
