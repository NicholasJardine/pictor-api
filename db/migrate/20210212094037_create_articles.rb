class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :description
      t.string :image
      t.string :title
      t.string :author
      t.text :paragraph_1
      t.text :paragraph_2
      t.text :paragraph_3
      t.text :paragraph_4
      t.text :paragraph_5
      t.text :paragraph_6

      t.timestamps
    end
  end
end
