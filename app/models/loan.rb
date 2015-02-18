class ValidatePersons < ActiveModel::Validator
  # Custom validation - check if debtor is not creditor
  def validate(record)
    if record.creditor_id == record.debtor_id
      record.errors[:base] << 'Creditor and debtor are the same person'
    end
  end
end

class Loan < ActiveRecord::Base
  # Model for loans. Loans are associated with users. 
  validates :creditor_id, presence: true
  validates :debtor_id, presence: true
  validates :sum, presence: true
  validates_with ValidatePersons, :fields => [:debtor_id, :creditor_id]

  belongs_to :creditor, :class_name => 'User', :foreign_key => :creditor_id
  belongs_to :debter, :class_name => 'User', :foreign_key => :debtor_id
end
