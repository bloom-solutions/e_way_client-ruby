require "spec_helper"

module EWayClient
  RSpec.describe QueryListBanksResponse do

    context "#banks" do
      let(:response) { described_class.new(data: data) }
      let(:data) do
        [
          {
            :"@diffgr:id" => "QueryListBanks4",
            :"@msdata:row_order" => "3",
            :bank_id => "7",
            :bank_name_eng => "NASBANK",
            :bank_name_viet => "Bắc Á",
            :response_code => "0000"
          },
          {
            :"@diffgr:id" => "QueryListBanks5",
            :"@msdata:row_order" => "4",
            :bank_id => "9",
            :bank_name_eng => "VIET CAPITAL BANK, VCCB",
            :bank_name_viet => "Bản Việt",
            :response_code => "0000"
          }
        ]
      end
      let(:banks) { response.banks }

      it "is an array of banks" do
        bank_1 = banks.first
        expect(bank_1.bank_id).to eq 7
        expect(bank_1.bank_name_eng).to eq "NASBANK"
        expect(bank_1.bank_name_viet).to eq "Bắc Á"
        expect(bank_1.response_code).to eq "0000"

        bank_2 = banks.last
        expect(bank_2.bank_id).to eq 9
        expect(bank_2.bank_name_eng).to eq "VIET CAPITAL BANK, VCCB"
        expect(bank_2.bank_name_viet).to eq "Bản Việt"
        expect(bank_2.response_code).to eq "0000"
      end
    end

  end
end
