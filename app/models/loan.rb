class Loan < ActiveRecord::Base
  validates :creditor_id, presence: true
  validates :debtor_id, presence: true
  validates :sum, presence: true
  validates_with ValidatePersons

  belongs_to :creditor, :class_name => 'User', :foreign_key => :creditor_id
  belongs_to :debter, :class_name => 'User', :foreign_key => :debtor_id
end

class ValidatePersons < ActiveModel::Validator
  def validate(record)
    if :creditor_id == :debtor_id
      record.errors << 'Creditor and debtor are the same person'
    end
  end
end
