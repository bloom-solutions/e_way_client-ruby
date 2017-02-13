require 'spec_helper'

module EWayClient
  RSpec.describe GenActionName do

    describe ".call" do
      it "generates the action name based on the request class" do
        expect(described_class.(SendTransactionRequest)).
          to eq :send_transaction

        expect(described_class.(QueryListBanksRequest)).
          to eq :query_list_banks
      end
    end

  end
end
