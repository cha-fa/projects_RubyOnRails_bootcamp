require_relative '../lib/dark_trader'

describe "fetching_symbol method" do
  it "should return at least the value BTC" do
    expect(fetching_symbol).to include("BTC") #s'il inclut BTC => n'est pas nil
  end
end

describe "fetching_symbol method" do
  it "should return at least 150 values" do
    expect(fetching_symbol.size).to be_between(100, 201).exclusive
  end
end

describe "fetching_price method" do
  it "should return at least one price" do
    expect(fetching_price).not_to be_nil
  end
end

describe "create-array method" do
  it "return at least a hash" do
    expect(create_array(["ETH"],["$162.44"])).to eq([{"ETH"=>"$162.44"}])
  end
end

