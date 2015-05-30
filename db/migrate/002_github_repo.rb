class GithubRepo < ActiveRecord::Migration
    def up
        create_table :github_repos do |r|
            r.string :name
        end
    end

    def down
        drop_table  :github_repos
    end
end