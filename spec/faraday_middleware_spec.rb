require 'faraday_middleware'

# needed for lazy loading
conn = Faraday.new do |f|
  f.response :xml
  f.response :json
end

describe FaradayMiddleware do
  it "successfully registers ParseXml as :xml" do
    expect(Faraday::Response.lookup_middleware(:xml)).to eq(FaradayMiddleware::ParseXml)
  end

  it "successfully registers ParseJson as :json" do
    expect(Faraday::Response.lookup_middleware(:json)).to eq(FaradayMiddleware::ParseJson)
  end
end
