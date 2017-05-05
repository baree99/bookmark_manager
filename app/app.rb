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
    @link = Link.create(title: params[:new_title], url: params[:new_url])
    new_tags = params[:new_tag].split(";")
    new_tags.each do |tag|
    tag_to_tbl = Tag.first_or_create(tag_name: tag)
    @link.tags << tag_to_tbl
    @link.save
    end
    redirect '/links'
  end

  get '/tag/:name' do
    @tags = Tag.all
    @links = Tag.all(tag_name: params[:name]).links
    erb :links
  end

end
