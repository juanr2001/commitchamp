module Commitchamp
    class GithubUser <ActiveRecord::Base
        has_many :github_collaborations
        has_many :github_repos, :through => :github_collaborations
    end
end