class CreatePrivateAuditions < ActiveRecord::Migration[5.2]
  def change
    create_table :private_auditions do |t|
      t.references :user, foreign_key: true
      t.references :private_brief, foreign_key: true
      t.string :video
      t.string :title

      t.timestamps
    end
  end
end
