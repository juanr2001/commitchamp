class GithubUser < ActiveRecord::Migration
    def up
        create_table :github_users do |u|
            u.string :name
        end
    end

    def down
        drop_table :github_users
    end
end