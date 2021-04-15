class Addlanguagetobriefs < ActiveRecord::Migration[5.2]
  def change
                add_column :briefs, :language, :string

  end
end
