class User < ActiveRecord::Base
  attr_accessor :username
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
  # validation
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true

  has_many :expenses
  has_many :debts, :class_name => 'Expense', :foreign_key => :debtor_id
  has_many :credits, :class_name => 'Expense', :foreign_key => :creditor_id

end
