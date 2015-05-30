module Commitchamp
    class Repo<ActiveRecord::Base
        has_many :collaborations
        has_many :users, :through => :collaborations
    end
end