require "spec_helper"

module EWayClient
  RSpec.describe SendTransactionResponse do

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
      described_class::ERROR_MESSAGE_MAP.each do |response_code, message|
        context "response_code is #{response_code}" do
          it "has a message '#{message}'" do
            response = described_class.new(response_code: response_code)
            expect(response.error_message).to eq message
          end
        end
      end
    end

  end
end
