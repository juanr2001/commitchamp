module Commitchamp
    class User<ActiveRecord::Base
        has_many :collaborations
        has_many :repos, :through => :collaborations
    end
end