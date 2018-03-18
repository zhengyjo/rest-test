require 'sinatra'
require 'json'
require 'rufus-scheduler'
require_relative './user_client'

set :port, 8080
set :environment, :production

get '/hello' do
  return_message = {}
  return_message[:hello] = 'hello, world! -- from Tom'
  return_message.to_json
end

s = Rufus::Scheduler.singleton

s.every '3s' do
  puts 'hi'
  client = UserClient.new 'tom'
  client.get_hello
end
