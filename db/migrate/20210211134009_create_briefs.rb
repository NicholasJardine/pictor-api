class CreateBriefs < ActiveRecord::Migration[5.2]
  def change
    create_table :briefs do |t|
      t.string :name
      t.string :gender
      t.string :age_range
      t.string :ethnicity
      t.text :flaws
      t.text :traits
      t.string :wants
      t.string :needs
      t.string :arc_summary
      t.string :profession
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
