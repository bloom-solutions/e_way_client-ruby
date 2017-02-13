require "spec_helper"

module EWayClient
  RSpec.describe QueryTxnStatusResponse do

    context "#response_code" do
      let(:response) { described_class.new(data: data) }
      let(:data) { {response_code: "1234"} }

      it "is taken from the data" do
        expect(response.response_code).to eq "1234"
      end
    end

    context "#success" do
      let(:data) { { response_code: response_code} }
      subject(:response) { described_class.new(data: data) }

      context "response_code is 0000" do
        let(:response_code) { "0000" }
        it { is_expected.to be_success }
      end

      context "response_code is something other than 0000" do
        let(:response_code) { "3010" }
        it { is_expected.to_not be_success }
      end
    end

    context "#error_message" do
      let(:data) { { response_code: response_code} }
      let(:response_code) { "3010" }
      subject(:response) { described_class.new(data: data) }

      it "conveys not enough information" do
        expect(response.error_message).to eq "3010: unknown description"
      end
    end

  end
end
