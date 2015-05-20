ENV['RACK_ENV'] = 'test'

require 'hi'  # <-- your sinatra app
require "company"
require 'rspec'
require 'rack/test'

describe 'The HelloWorld App' do
  include Rack::Test::Methods


  before :each do
    @company = Company.new
  end

  def app
    Sinatra::Application
  end

  context "at startup" do
  	it "has a default company name" do
  		expect(@company).not_to be_nil
  		expect(@company.name).to eq('Default')
  		expect(@company.symbol).to eq('DFT')
  	end

  	it "says hello" do
    	get '/hi'
    	expect(last_response).to be_ok
    	expect(last_response.body).to eq('Hello World!')
  	end
  end
end