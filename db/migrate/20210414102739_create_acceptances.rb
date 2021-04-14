class CreateAcceptances < ActiveRecord::Migration[5.2]
  def change
    create_table :acceptances do |t|
      t.references :user, foreign_key: true
      t.references :private_invite, foreign_key: true

      t.timestamps
    end
  end
end
