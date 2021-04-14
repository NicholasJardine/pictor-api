class CreatePrivateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :private_invites do |t|
      t.references :user, foreign_key: true
      t.references :private_brief, foreign_key: true

      t.timestamps
    end
  end
end
