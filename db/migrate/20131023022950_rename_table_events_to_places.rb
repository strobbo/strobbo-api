class RenameTableEventsToPlaces < ActiveRecord::Migration

	def up
		rename_table :events, :places
	end

	def down
		rename_table :places, :events
	end

end
