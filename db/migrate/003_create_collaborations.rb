class CreateCollaborations < ActiveRecord::Migration
    def up
        create_table :collaborations do |c|
            c.integer :user_id
            c.integer :repo_id
            c.integer :commit_count
            c.integer :additions
            c.integer :deletions
        end
    end

    def down
        drop_table :collaborations

    end

end