require 'sinatra/base'
require 'octokit'
require 'rest-client'
require 'json'
require 'github_api'

class Unboxed < Sinatra::Base

  get '/' do

    erb :index
  end

  post '/' do
    @username = params[:username]
    @username.to_s
    p @username
    redirect to('/user')
  end

  get '/user' do
    user = Octokit.user 'usmanj'
    puts user.name
    puts user.rels[:repos].href
    repos = user.rels[:repos].get.data
    puts repos.first.language

    language_obj = {}
    repos.each do |repo|
      if repo.language
        if !language_obj[repo.language]
          language_obj[repo.language] = 1
        else
          language_obj[repo.language] += 1
        end
      end
    end
    
    puts language_obj

    erb :user
  end

  run! if app_file == Unboxed
end
