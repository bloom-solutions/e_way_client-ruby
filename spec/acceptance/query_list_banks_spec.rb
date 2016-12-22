require 'spec_helper'

RSpec.describe "QueryListBanks", vcr: {record: :once} do

  it "returns a list of banks" do
    client = EWayClient.new(CONFIG)
    response = client.query_list_banks

    expect(response).to be_success
    expect(response.banks).to_not be_empty
  end

end
