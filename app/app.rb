ENV['RACK_ENV'] ||='development'
require 'sinatra/base'
require 'pry'
require_relative './models/data_mapper_setup'


class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    erb :links
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links' do
    link = Link.create(title: params[:new_title], url: params[:new_url])
    tag = Tag.create(tag_name: params[:new_tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/tag/:name' do
    @tags = Tag.all
    @links = Tag.all(tag_name: params[:name]).links
    erb :links
  end

end
