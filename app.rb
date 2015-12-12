require 'sinatra/base'
require 'octokit'

class Unboxed < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do
    $username = params[:username]
    redirect to('/user')
  end

  get '/user' do
    @user = Octokit.user($username)
    repos = @user.rels[:repos].get.data

    @language_obj = {}
    repos.each do |repo|
      if repo.language
        if !@language_obj[repo.language]
          @language_obj[repo.language] = 1
        else
          @language_obj[repo.language] += 1
        end
      end
    end
    erb :user
  end

  run! if app_file == Unboxed
end
