require 'spec_helper'

module EWayClient
  RSpec.describe SendTransactionRequest, type: %i[virtus] do

    it "inherits from BaseRequest" do
      expect(described_class < BaseRequest).to be true
    end

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:agent_code, String) }
      it { is_expected.to have_attribute(:username, String) }
      it { is_expected.to have_attribute(:password, String) }
      it { is_expected.to have_attribute(:transaction_id, String) }
    end

  end
end
