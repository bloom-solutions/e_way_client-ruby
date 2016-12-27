require 'spec_helper'

module EWayClient
  RSpec.describe Province do

    describe "#response_code" do
      let(:data) { {response_code: "0000"} }
      let(:province) { described_class.new(data: data) }
      subject { province.response_code }
      it { is_expected.to eq "0000" }
    end

    describe "#province_id" do
      let(:data) { {province_id: "1"} }
      let(:province) { described_class.new(data: data) }
      subject { province.province_id }
      it { is_expected.to eq 1 }
    end

    describe "#province_name_eng" do
      let(:data) { {province_name_eng: "Eng name"} }
      let(:province) { described_class.new(data: data) }
      subject { province.province_name_eng }
      it { is_expected.to eq "Eng name" }
    end

    describe "#province_name_viet" do
      let(:data) { {province_name_viet: "viet name"} }
      let(:province) { described_class.new(data: data) }
      subject { province.province_name_viet }
      it { is_expected.to eq "viet name" }
    end

    describe "#districts" do
      let(:data) { {districts1: "d1, d2, d3.", districts2: "d4, d5"} }
      let(:province) { described_class.new(data: data) }
      subject { province.districts }
      it { is_expected.to match_array %w(d1 d2 d3 d4 d5) }
    end

    described_class::TYPES_COUNT.times do |n|
      count = n+1
      describe "#districts#{count}" do
        let(:data) { {:"districts#{count}" => "d1, d2."} }
        let(:province) { described_class.new(data: data) }

        it "returns data - districts#{count}" do
          expect(province.send("districts#{count}")).to match_array(%w(d1 d2))
        end
      end

      describe "#time#{count}" do
        let(:data) { {:"time#{count}" => "6-9"} }
        let(:province) { described_class.new(data: data) }

        it "returns data - time#{count}" do
          expect(province.send("time#{count}")).to eq "6-9"
        end
      end
    end

  end
end
