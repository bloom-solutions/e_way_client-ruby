require 'spec_helper'

RSpec.describe "QueryListProvinces", vcr: {record: :once} do

  it "returns a list of provinces" do
    client = EWayClient.new(CONFIG)
    response = client.query_list_provinces

    expect(response).to be_success
    expect(response.provinces).to_not be_empty
  end

end
