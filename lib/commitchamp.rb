$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'pry'

require 'commitchamp/version'
require 'commitchamp/init_db'
require 'commitchamp/github'
require 'commitchamp/user'
require 'commitchamp/collaboration'
require 'commitchamp/repo'

module Commitchamp
  class App
    def initialize
      @github = Github.new
    end
  end
end

# app = Commitchamp::App.new
 binding.pry
