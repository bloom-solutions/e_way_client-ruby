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
      it { is_expected.to have_attribute(:transaction_date, Time) }
      it { is_expected.to have_attribute(:degit_code, String) }
      it { is_expected.to have_attribute(:transaction_amount, Integer) }
      it { is_expected.to have_attribute(:sett_amount, Integer) }
      it { is_expected.to have_attribute(:transaction_currency, String) }
      it { is_expected.to have_attribute(:sett_currency, String) }
      it { is_expected.to have_attribute(:sett_conversion_rate, Float) }
      it { is_expected.to have_attribute(:paymentmode, String) }
      it { is_expected.to have_attribute(:sender_name, String) }
      it { is_expected.to have_attribute(:sender_address, String) }
      it { is_expected.to have_attribute(:sender_district, String) }
      it { is_expected.to have_attribute(:sender_city, String) }
      it { is_expected.to have_attribute(:sender_country, String) }
      it { is_expected.to have_attribute(:sender_question, String) }
      it { is_expected.to have_attribute(:sender_answer, String) }
      it { is_expected.to have_attribute(:receiver_name, String) }
      it { is_expected.to have_attribute(:receiver_address, String) }
      it { is_expected.to have_attribute(:receiver_wards, String) }
      it { is_expected.to have_attribute(:receiver_district, String) }
      it { is_expected.to have_attribute(:receiver_city, String) }
      it { is_expected.to have_attribute(:receiver_phone, String) }
      it { is_expected.to have_attribute(:hours_receive, String) }
      it { is_expected.to have_attribute(:bank_id, String) }
      it { is_expected.to have_attribute(:bank_account_number, String) }
      it { is_expected.to have_attribute(:transaction_message, String) }
      it { is_expected.to have_attribute(:transaction_key, String) }
      it { is_expected.to have_attribute(:bankbranch_name, String) }
      it { is_expected.to have_attribute(:bankbranch_address, String) }
      it { is_expected.to have_attribute(:secret, String) }
    end

    describe "#transaction_key" do
      let(:expected_hash) do
        Digest::MD5.hexdigest([50_000, "FT", "99999"].join)
      end
      let(:request) do
        described_class.new(
          transaction_amount: 50_000,
          paymentmode: "FT",
          secret: "99999",
        )
      end

      it "is the md5 hash of the transaction amount, paymentmode, and secret" do
        expect(request.transaction_key).to eq expected_hash
      end
    end

    describe "#transaction_date" do
      let(:request) { described_class.new(transaction_date: transaction_date) }
      subject { request.transaction_date }
      before do
        Timecop.freeze
      end

      context "no date is set" do
        let(:transaction_date) { nil }
        it { is_expected.to be_nil }
      end

      context "date is set" do
        let(:transaction_date) { Time.now }
        let(:expected_time) do
          Time.now.in_time_zone("Bangkok").strftime("%m/%d/%Y %H:%M:%S")
        end
        it { is_expected.to eq expected_time }
      end
    end

  end
end
