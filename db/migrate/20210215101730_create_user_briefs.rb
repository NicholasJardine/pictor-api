class CreateUserBriefs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_briefs do |t|
      t.references :user, foreign_key: true
      t.references :brief, foreign_key: true

      t.timestamps
    end
  end
end
