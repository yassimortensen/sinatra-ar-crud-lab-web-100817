require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  #   erb :index
  # end

  #create
  get '/posts/new' do
    erb :new
  end

  #create
  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    redirect "/posts"
  end

  #read
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  #read
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  #update
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  #update
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    redirect "/posts/#{@post.id}"
  end

  #delete
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    erb :delete
  end

end
