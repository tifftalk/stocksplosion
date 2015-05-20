class StockHelper
	require 'net/http'
	require 'json'

	SUMMARY_SOURCE = 'http://stocksplosion.apsis.io/api/company'

	def load_company_summaries
		map_company_summaries(get_company_summary_json())
	end

	def get_company_summary_json
		uri = URI(SUMMARY_SOURCE)
		company_summary_json = Net::HTTP.get(uri)
		JSON.parse(company_summary_json)
	end
	
	def map_company_summaries(cs_json)
		company_summaries = cs_json.map { |company| CompanySummary.new(company['symbol'], company['name']) }
	end
end