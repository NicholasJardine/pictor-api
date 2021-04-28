class Adddetailstousers < ActiveRecord::Migration[5.2]
  def change
       add_column :users, :cv, :string
   add_column :users, :services, :string
   add_column :users, :cell, :string
   add_column :users, :tel, :string
   add_column :users, :company_email, :string
  add_column :users, :age, :integer
    add_column :users, :ciricv, :string
    add_column :users, :accepted_terms, :boolean, default: false
     add_column :users, :talents, :string
    add_column :users, :bio, :text
    add_column :users, :skills, :text
    add_column :users, :location, :string
    add_column :users, :experience, :text
    add_column :users, :suburb, :string
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :ethnicty, :string
    add_column :users, :language, :string
    add_column :users, :marital_status, :string
    add_column :users, :profession, :string
    add_column :users, :city, :string
    add_column :users, :postal_code, :string
    add_column :users, :address, :string
    add_column :users, :province, :string
    add_column :users, :photo, :string
    add_column :users, :occupation, :string
  end
end
