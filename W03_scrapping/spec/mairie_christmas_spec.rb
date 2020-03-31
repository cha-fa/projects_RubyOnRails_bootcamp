require_relative '../lib/mairie_christmas'

describe "get_townhall_url method" do
  it "should return at least the URL of Hedouville" do
    expect(get_townhall_urls).to include("./95/hedouville.html") #s'il inclut hedouville => n'est pas nil
  end
end

describe "get_all_townhall_email" do
  it "should return at least the email of seugy town" do
    expect(get_all_townhall_email(["./95/ableiges.html"])).to eq(["mairie.ableiges95@wanadoo.fr"])
  end
end

describe "create_array_town method" do
  it "return at least a hash" do
    expect(create_array_town(["HERBLAY"],["mairie@herblay.fr"])).to eq([{"HERBLAY"=>"mairie@herblay.fr"}])
  end
end

