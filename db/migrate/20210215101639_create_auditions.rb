class CreateAuditions < ActiveRecord::Migration[5.2]
  def change
    create_table :auditions do |t|
      t.string :video
      t.string :title
      t.references :user, foreign_key: true
      t.references :brief, foreign_key: true

      t.timestamps
    end
  end
end
