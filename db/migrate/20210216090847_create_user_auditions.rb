class CreateUserAuditions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_auditions do |t|
      t.references :user, foreign_key: true
      t.references :audition, foreign_key: true

      t.timestamps
    end
  end
end
