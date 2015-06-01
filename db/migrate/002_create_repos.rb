class CreateRepos<ActiveRecord::Migration
    def up
        create_table :repos do |r|
            r.string :name
            r.string :owner
        end
    end

    def down
        drop_table  :repos
    end
end