class Addstatustoacceptances < ActiveRecord::Migration[5.2]
  def change
                    add_column :acceptances, :status, :string, default: "Pending"

  end
end
