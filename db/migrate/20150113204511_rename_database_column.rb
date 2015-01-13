class RenameDatabaseColumn < ActiveRecord::Migration
  def self.up
    rename_column :loans, :creditor, :creditor_id
    rename_column :loans, :debtor, :debtor_id
  end
end
