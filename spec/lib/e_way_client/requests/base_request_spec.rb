require 'spec_helper'

module EWayClient
  RSpec.describe BaseRequest, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:wsdl, String) }
      it { is_expected.to have_attribute(:username, String) }
      it { is_expected.to have_attribute(:password, String) }
      it { is_expected.to have_attribute(:log).with_default(false) } # Boolean
      it { is_expected.to have_attribute(:logger) }
    end

    describe "#soap_client_args" do
      let(:logger) { double }
      let(:request) do
        described_class.new({
          wsdl: "wsdl",
          username: "u",
          password: "p",
          log: true,
          logger: logger,
          message: {hi: "there"}
        })
      end

      it "includes the wsdl, action based on the class name, message, log info" do
        expect(GenActionName).to receive(:call).with(described_class).
          and_return(:base)

        expect(request.soap_client_args[:wsdl]).to eq "wsdl"
        expect(request.soap_client_args[:username]).to eq "u"
        expect(request.soap_client_args[:password]).to eq "p"
        expect(request.soap_client_args[:log]).to be true
        expect(request.soap_client_args[:logger]).to eq logger
        expect(request.soap_client_args[:message]).to eq({hi: "there"})
        expect(request.soap_client_args[:action]).to eq :base
      end
    end

  end
end
