class AddSceneToBriefs < ActiveRecord::Migration[5.2]
  def change
        add_column :briefs, :scene, :string

  end
end
