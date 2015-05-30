require 'httparty'


module Commitchamp
    ACCESS_TOKEN = ENV['ACCESS_TOKEN']
  class Github
    include HTTParty
    base_uri "https://api.github.com"

    def initialize
      @headers = { "Authorization" => "token #{ACCESS_TOKEN}",
                   "User-Agent" => "HTTParty" }
    end

    # def organitazion(org)
    #     self.class.get("/org/#{org}/repos", headers: @headers)

    # end
    def organization_repo(owner, repo)
        self.class.get("/repos/#{owner}/#{repo}/stats/contributors", headers: @headers)
    end




  end
end

