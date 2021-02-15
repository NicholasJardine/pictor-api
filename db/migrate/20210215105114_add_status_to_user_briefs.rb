class AddStatusToUserBriefs < ActiveRecord::Migration[5.2]
  def change
    add_column :user_briefs, :status, :string, default: "Pending"
  end
end
