class Addstatustoaccountcomplaints < ActiveRecord::Migration[5.2]
  def change
                        add_column :account_complaints, :career_changes, :boolean, default: false
            add_column :account_complaints, :not_recieving_briefs, :boolean, default: false
            add_column :account_complaints, :dont_like_it, :boolean, default: false
            add_column :account_complaints, :unsatisfied, :boolean, default: false
            add_column :account_complaints, :not_useful, :boolean, default: false
  end
end
