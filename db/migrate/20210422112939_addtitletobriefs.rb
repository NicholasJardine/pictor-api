class Addtitletobriefs < ActiveRecord::Migration[5.2]
  def change
                    add_column :briefs, :title, :string

  end
end
