class CreateAccountComplaints < ActiveRecord::Migration[5.2]
  def change
    create_table :account_complaints do |t|
      t.references :user, foreign_key: true
      t.text :custom

      t.timestamps
    end
  end
end
