class GithubCollaboration < ActiveRecord::Migration
    def up
        create_table :github_collaborations do |c|
            t.integer :user_id
            t.integer :repo_id
            t.integer :commit_cout
            t.integer :additions
            t.integer :deletions
        end
    end

    def down
        drop_table :github_collaborations

    end

end