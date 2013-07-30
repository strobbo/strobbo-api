class AlterTableUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_url, :string
    add_column :users, :gender, :string
		add_column :users, :age_range, :string

		rename_column :users, :image, :image_url

		remove_column :users, :access_token
		remove_column :users, :encrypted_password
  end
end
