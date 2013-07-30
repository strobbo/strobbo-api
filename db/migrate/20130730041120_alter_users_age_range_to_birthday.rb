class AlterUsersAgeRangeToBirthday < ActiveRecord::Migration
  def change
		remove_column :users, :age_range
		add_column :users, :birthday, :date
  end
end
