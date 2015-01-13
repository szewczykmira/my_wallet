class Expense < ActiveRecord::Base
  validates :user_id, presence: true
  validates :for_what, presence: true
  validates :expense_date, presence:true
  validates :how_much, presence: true

  belongs_to :user
end
