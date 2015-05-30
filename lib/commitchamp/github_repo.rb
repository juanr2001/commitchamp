module Commitchamp
    class GithubRepo < ActiveRecord::Base
        has_many :github_collaborations
        has_many :github_users, :through => :github_collaborations
    end
end