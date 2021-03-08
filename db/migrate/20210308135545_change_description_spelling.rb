class ChangeDescriptionSpelling < ActiveRecord::Migration[6.0]
  def change
    rename_column :cocktails, :descirpton, :description
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
