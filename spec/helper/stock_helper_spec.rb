ENV['RACK_ENV'] = 'test'

require "model/company_summary"
require "helper/stock_helper"
require 'rspec'
require 'rack/test'

describe 'StockHelper' do
  include Rack::Test::Methods

  before :all do
    @stock_helper = StockHelper.new
  end

  def app
    Sinatra::Application
  end

  context "loaded from mock" do
    it "loads and parses company summaries" do
      sh = StockHelper.new
      cs_json = [{'symbol' => 'TST', 'name' => 'test'}]
      allow(sh).to receive(:get_company_summary_json).and_return(cs_json)

      summaries = sh.load_company_summaries
      expect(summaries.size).to eq(1)
      expect(summaries[0].symbol).to eq('TST')
      expect(summaries[0].name).to eq('test')
    end
  end

  context "loaded from server" do
    it "loads and parses company summaries" do
      summaries = @stock_helper.load_company_summaries
      expect(summaries.size).to eq(100)
  	end
  end
end