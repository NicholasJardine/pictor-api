class CreatePrivateBriefs < ActiveRecord::Migration[5.2]
  def change
    create_table :private_briefs do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :ethnicity
      t.string :language
      t.string :marital_status
      t.references :user, foreign_key: true
      t.integer :sender_id
      t.string :title
      t.string :scene
      t.string :profession
      t.string :hometown
      t.string :current_home
      t.text :wants
      t.text :needs
      t.text :traits
      t.text :flaws
      t.text :arc_summary

      t.timestamps
    end
  end
end
