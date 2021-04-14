class Addstatustoprivatebriefs < ActiveRecord::Migration[5.2]
  def change
        add_column :private_briefs, :status, :string, default: "Pending"

  end
end
