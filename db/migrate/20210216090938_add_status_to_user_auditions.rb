class AddStatusToUserAuditions < ActiveRecord::Migration[5.2]
  def change
    add_column :user_auditions, :status, :string, default: "Pending"

  end
end
