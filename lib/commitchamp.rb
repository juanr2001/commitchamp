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
    end

    def existing_or_fetch
        puts "Do you want to access an Existing(e) repo or fetch a New(n) repo?( e/n)"
        answer = "e" || "n"
        answer = gets.chomp
        if answer == "e"
            existing_repos
        else
            fetch_repo
        end
    end

    def existing_repos
        puts "These are the existing repos."
            Repo.all.order(:orders_count, created_at: :desc)
            if Repo.all.empty?
                puts "Opps! There are not repos available"
                fetch_repo
            else
                pick_repo
            end
    end

    def pick_contributor
        puts "If you'd like, pick a contributor of this repo: "
        contributor = gets.chomp
        Collaboration.find_by(:additions, :deletions)
        if
    end

    def fetch_repo
        puts "you got it"

    end

    def organization_and_repo

    end

    def table_contributions

    end

  end
end

#app = Commitchamp::App.new
binding.pry
