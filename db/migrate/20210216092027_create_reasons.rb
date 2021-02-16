class CreateReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :reasons do |t|
      t.references :user, foreign_key: true
      t.references :brief, foreign_key: true

      t.timestamps
    end
  end
end
