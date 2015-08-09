# **** GEMs ****
require 'bundler'
Bundler.require()

# **** Connection ****
require './connection'

# **** Models ****
require './models/animal'
require './models/person'
require './models/kitten'


namespace :people do
  desc 'Generate Random People'
  task :generate, [:numNames] do |t, args|
    args[:numNames].to_i.times do
      Person.create({name: Faker::Name.name})
    end
  end
end

namespace :animals do
  desc 'Generate Random Animals'
  task :generate, [:numNames] do |t, args|
    args[:numNames].to_i.times do
      Animal.create({
        name: Faker::Name.first_name,
        sound: Faker::Hacker.verb,
        description: Faker::Company.bs
      })
    end
  end
end


namespace :kittens do
  desc 'Generate Random kittens'

  def random_pic_url
    width = (200..300).to_a.sample
    height = (200..300).to_a.sample
    "http://placekitten.com/#{width}/#{height}"
  end

  task :generate, [:numNames] do |t, args|
    args[:numNames].to_i.times do
      Kitten.create({
        name: Faker::Name.first_name,
        pic_url: random_pic_url
      })
    end
  end
end

namespace :db do
  desc 'reset database table'
  task :truncate, [:tableName] do |t, args|
    table_name = args[:tableName]
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name} RESTART IDENTITY")
  end
end
