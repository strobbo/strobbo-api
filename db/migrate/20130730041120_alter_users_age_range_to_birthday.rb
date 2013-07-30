class AlterUsersAgeRangeToBirthday < ActiveRecord::Migration
  def change
		change_column :users, :age_range, :date
		rename_column :users, :age_range, :birthday
  end
end
