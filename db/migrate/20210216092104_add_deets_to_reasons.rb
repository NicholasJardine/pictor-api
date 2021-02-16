class AddDeetsToReasons < ActiveRecord::Migration[5.2]
  def change
            add_column :reasons, :human_trafficking, :boolean, default: false
            add_column :reasons, :unsafe, :boolean, default: false
            add_column :reasons, :sexual_content, :boolean, default: false
            add_column :reasons, :child_abuse, :boolean, default: false
            add_column :reasons, :not_legit, :boolean, default: false
  end
end
