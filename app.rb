require 'bundler'
Bundler.require()

# **** Database Connection ****
require './connection'

# **** Models ****
require './models/animal'
require './models/person'
require './models/kitten'
require './models/chirp'

# **** Allow CORS ****
before do
  headers( "Access-Control-Allow-Origin" => "*" )
end

# **** Animals Routes ****
get '/api/animals' do
  content_type :json
  animals = Animal.all
  animals.to_json
end

get '/api/animals/:id' do
  content_type :json
  animal = Animal.find(params[:id])
  animal.to_json
end

post '/api/animals' do
  content_type :json
  animal = Animal.create(params[:animal])
  animal.to_json
end

patch '/api/animals/:id' do
  content_type :json
  animal = Animal.find(params[:id])
  animal.update(params[:animal])
  animal.to_json
end

delete '/api/animals/:id' do
  content_type :json
  Animal.delete(params[:id])
  {message: 'success'}.to_json
end

get '/' do
  @animal = Animal.all.sample
  erb :index
end




get '/all-the-animals' do
  redirect '/api/animals', 302
end






# **** Animals Routes ****
get '/api/chirps' do
  content_type :json
  chirps = Chirp.all
  chirps.to_json
end

get '/api/chirps/:id' do
  content_type :json
  chirp = Chirp.find(params[:id])
  chirp.to_json
end

post '/api/chirps' do
  content_type :json
  chirp = Chirp.create(params[:chirp])
  chirp.to_json
end

patch '/api/chirps/:id' do
  content_type :json
  chirp = Chirp.find(params[:id])
  chirp.update(params[:chirp])
  chirp.to_json
end

delete '/api/chirps/:id' do
  content_type :json
  Chirp.delete(params[:id])
  {message: 'success'}.to_json
end




# **** People ****
get '/api/people' do
  content_type :json
  people = Person.all
  people.to_json
end

get '/api/people/random' do
  content_type :json
  person = Person.all.sample
  person.to_json
end

get '/api/people/search' do
  content_type :json
  query = params[:query]
  people = Person.where("name ilike ?", "%#{query}%").limit(20)
  people.to_json
end



# *** Kittens! ***
get '/api/kittens' do
  content_type :json
  kittens = Kitten.all
  kittens.to_json
end

get '/api/kittens/:id' do
  content_type :json
  kitten = Kitten.find(params[:id])
  kitten.to_json
end

post '/api/kittens' do
  content_type :json
  kitten = Kitten.create(params[:kitten])
  kitten.to_json
end

patch '/api/kittens/:id' do
  content_type :json
  kitten = Kitten.find(params[:id])
  kitten.update(params[:kitten])
  kitten.to_json
end

delete '/api/kittens/:id' do
  content_type :json
  Kitten.delete(params[:id])
  {message: 'You have successfuly freed a kitten.'}.to_json
end





not_found do
  content_type :json
  status 404
  {message: 'Not Found'}.to_json
end
