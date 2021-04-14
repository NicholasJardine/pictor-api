class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.references :user, foreign_key: true
      t.references :user_brief, foreign_key: true
      t.string :province

      t.timestamps
    end
  end
end
