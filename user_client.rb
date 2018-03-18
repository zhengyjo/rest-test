require 'json'
require 'rest-client'

class UserClient
  attr_reader :name

  def initialize name
    @name = name
    @conversation = {}
    @counter = 0
  end

#  def join_game
#    response = RestClient.post 'http://localhost:8080/join', :data => {name: @name}.to_json, :accept => :json
#    puts JSON.parse(response,:symbolize_names => true)
#  end
#
#  def get_cards
#    response = RestClient.get 'http://localhost:8080/cards', {:params => {:name => @name}}
#    puts response
#  end
#
#  def deal
#    response = RestClient.post 'http://localhost:8080/deal', :data =>{}.to_json, :accept => :json
#    puts response
#  end

  def get_hello
    response = RestClient.get 'http://protected-bastion-93597.herokuapp.com/hello', {}
    resp_hash = JSON.parse(response)
    @counter = @counter + 1
    key = @counter.to_s
    @conversation[key] = resp_hash['hello']
    puts @conversation.inspect
    puts response
  end


end
