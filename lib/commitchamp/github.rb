require 'httparty'
#require 'pry'

module Commitchamp
    ACCESS_TOKEN = ENV['ACCESS_TOKEN']
  class Github
    include HTTParty
    base_uri "https://api.github.com"

    def initialize
      @headers = { "Authorization" => "token #{ACCESS_TOKEN}",
                   "User-Agent" => "HTTParty" }
    end

    def organization_members(org)
        self.class.get("/orgs/#{org}/members", headers: @headers)

    end
    def organization_repo(owner, repo)
        self.class.get("/repos/#{owner}/#{repo}/stats/contributors", headers: @headers)
    end

    def addition_deletion(owner, repo)
      self.class.get("/repos/#{owner}/#{repo}/stats/code_frequency", headers: @headers)
    end

    def commit_count(owner, repo)
      self.class.get("/repos/#{owner}/#{repo}/stats/participation", headers: @headers)
    end
  end
end
#binding.pry

