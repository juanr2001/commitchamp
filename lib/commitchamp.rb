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
      @repo = nil
      @board = nil
      @org = nil
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
                pick_contributor
            end
    end

    # def pick_contributor
    #     puts "If you'd like, pick a contributor of this repo: "
    #     contributor = gets.chomp
    #     Collaboration.find_by(user_id: @user.id)

    # end

    def fetch_repo()
        puts "Create a new repo, just type the name: "
        repo = gets.chomp
        @repo = Repo.find_or_create_by(name: repo)
    end

    def organization_and_repo
        puts "Please enter the name of the organization: "
        name = gets.chomp
        puts "Enter the name of the repo: "
        owner = gets.chomp
        @org = Repo.find_or_create_by(owner: owner, name: name )
        table_contributions()
    end

    def table_contributions
        puts "Do you want to see who collaborated? (y/n)"
        answer = gets.chomp
        answer =~ /^[yn]$/
        if answer == "y"
            @org.additions
            @org.deletions
        else
            puts "Do you want to re-enter a new repo(n), see an existing repo(e) or quite?(n/e/q)"
            reponse =~ /^[ynq]$/
            if response == "n"
                fetch_repo
            elsif response == "e"
                existing_repos
            else
                puts "Come back soon!"
                break
            end
        end
    end

  end
end

#app = Commitchamp::App.new
binding.pry
