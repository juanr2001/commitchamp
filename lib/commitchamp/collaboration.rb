module Commitchamp
    class Collaboration<ActiveRecord::Base
        belongs_to :user
        belongs_to :repo
    end
end