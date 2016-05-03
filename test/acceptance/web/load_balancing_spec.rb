require 'serverspec_helper'
require 'net/http'
require 'uri'

load_balacer_url = 'http://192.168.8.8/'

describe 'load balancer' do
  it 'should call both upstreams' do
    uri = URI.parse(load_balacer_url)
    response_counter = {}
    response_counter.default = 0
    10.times do
      response = Net::HTTP.get_response(uri)
      expect(response.code).to eq '200'
      expect(response.body).to match /^Hi there, I\'m served from app[1-2]!$/
      response_counter[response.body] = response_counter[response.body] + 1
    end
    expect(response_counter.length).to eq 2
    expect(response_counter.values).to match_array [5, 5]
  end
end
