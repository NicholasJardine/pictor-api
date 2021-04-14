class Addsometopbreasons < ActiveRecord::Migration[5.2]
  def change
                add_column :pb_reasons, :human_trafficking, :boolean, default: false
            add_column :pb_reasons, :unsafe, :boolean, default: false
            add_column :pb_reasons, :sexual_content, :boolean, default: false
            add_column :pb_reasons, :child_abuse, :boolean, default: false
            add_column :pb_reasons, :not_legit, :boolean, default: false
  end
end
