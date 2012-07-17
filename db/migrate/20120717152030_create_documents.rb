class CreateDocuments < ActiveRecord::Migration
	def change
		create_table :documents do |t|
			t.string :orderNumber
			t.text :xmlDoc

			t.timestamps

		end
	end
end
