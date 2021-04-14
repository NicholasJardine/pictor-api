class CreatePbReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :pb_reasons do |t|
      t.references :user, foreign_key: true
      t.references :private_brief, foreign_key: true
      t.text :custom

      t.timestamps
    end
  end
end
