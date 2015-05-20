ENV['RACK_ENV'] = 'test'

require "company"
require 'rspec'
require 'rack/test'

describe 'Company' do
  include Rack::Test::Methods


  before :all do
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
  end
end