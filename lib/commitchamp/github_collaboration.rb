module Commitchamp
    class GithubCollaboration < ActiveRecod::Base
        belongs_to :user
        belongs_to :repo
    end
end