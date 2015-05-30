class CreateUsers<ActiveRecord::Migration
    def up
        create_table :users do |u|
            u.string :name
        end
    end

    def down
        drop_table :users
    end
end