class Addstatustoprivateinvites < ActiveRecord::Migration[5.2]
  def change
            add_column :private_invites, :status, :string, default: "Pending"

  end
end
