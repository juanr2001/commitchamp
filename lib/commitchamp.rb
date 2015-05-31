$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'pry'

require 'commitchamp/version'
require 'commitchamp/init_db'
require 'commitchamp/github'
require 'commitchamp/user'
require 'commitchamp/collaboration'
require 'commitchamp/repo'

module Commitchamp
     ACCESS_TOKEN = ENV['ACCESS_TOKEN']
  class App
    def initialize
      @github = Github.new
      @current_user = nil
    end

    def login
    end
  end
end

#app = Commitchamp::App.new
binding.pry
