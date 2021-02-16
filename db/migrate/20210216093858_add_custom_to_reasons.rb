class AddCustomToReasons < ActiveRecord::Migration[5.2]
  def change
    add_column :reasons, :custom, :text
  end
end
