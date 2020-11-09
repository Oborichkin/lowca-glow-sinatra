require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/base'

module MyAppModule

  class App < Sinatra::base

    register Sinatra::Namespace

    get '/' do
        'Hello My Sinatra - Easy and Wide world!'
    end

    get '/' do
        "This route is fired"
        redirect to('/hello/World')
    end

    get %r{/hello/([\w]+)} do |c|
      "Hello, #{c}!"
    end

    get '/say/*/to/*' do
      params['splat']
    end

    get '/download/*.*' do |path, ext|
      [path, ext].to_s
    end

    get '/jobs.?:format?' do
      'Да, работает этот маршрут!'
    end

    namespace '/api/v1' do
      get "/*" do
        "I don't know what is the #{params[:splat]}. It's what you typed."
      end
    end

  end
end