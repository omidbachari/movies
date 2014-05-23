require 'sinatra'
require 'csv'
require 'pry'
 
def movies
movies = []
CSV.foreach("movies.csv", headers: true) do |row|
  movies << row.to_hash
end
movies
end
 
 
get '/' do
  @movies = movies
  erb :index
end
 
get '/movie/:movie' do
  @movies = movies
  params[:movie]
  @movie = Hash.new
  @movies.each do |m|
    if params["movie"] == m["title"]
      @movie = m
    end
  end
  erb :movie
end
