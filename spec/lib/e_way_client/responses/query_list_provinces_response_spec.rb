require "spec_helper"

module EWayClient
  RSpec.describe QueryListProvincesResponse do

    context "#provinces" do
      let(:response) { described_class.new(data: data) }
      let(:data) do
        [
          {
            :response_code=>"0000",
            :province_id=>"9",
            :province_name_eng=>"ANGIANG",
            :province_name_viet=>"An Giang",
            :districts1=>"Long Xuyen, Chau Doc, An Phu, Chau Phu, Chau Thanh, Cho Moi, Phu Tan, Tan Chau, Thoai Son, Tinh Bien, Tri Ton.",
            :time1=>"6-12",
            :"@diffgr:id"=>"QueryListProvinces1",
            :"@msdata:row_order"=>"0"
          },
          {
            :response_code=>"0000",
            :province_id=>"1",
            :province_name_eng=>"BA RIA - VUNG TAU",
            :province_name_viet=>"Bà Rịa Vũng Tàu",
            :districts1=>"Vung Tau, Ba Ria, ChauDuc, Dat Do, Long Dien, Tan Thanh, XuyenMoc, Con Dao",
            :time1=>"6-12",
            :districts2=>"Con Dao",
            :time2=>"Not yet",
            :"@diffgr:id"=>"QueryListProvinces2",
            :"@msdata:row_order"=>"1"
          }
        ]
      end
      let(:provinces) { response.provinces }

      it "is an array of provinces" do
        province_1 = provinces.first
        expect(province_1.response_code).to eq "0000"
        expect(province_1.province_id).to eq 9
        expect(province_1.province_name_eng).to eq "ANGIANG"
        expect(province_1.province_name_viet).to eq "An Giang"
        expect(province_1.districts1).
          to eq "Long Xuyen, Chau Doc, An Phu, Chau Phu, Chau Thanh, Cho Moi, Phu Tan, Tan Chau, Thoai Son, Tinh Bien, Tri Ton."
        expect(province_1.time1).to eq "6-12"

        province_2 = provinces.last
        expect(province_2.response_code).to eq "0000"
        expect(province_2.province_id).to eq 1
        expect(province_2.province_name_eng).to eq "BA RIA - VUNG TAU"
        expect(province_2.province_name_viet).to eq "Bà Rịa Vũng Tàu"
        expect(province_2.districts1).
          to eq "Vung Tau, Ba Ria, ChauDuc, Dat Do, Long Dien, Tan Thanh, XuyenMoc, Con Dao"
        expect(province_2.time1).to eq "6-12"
        expect(province_2.districts2).to eq "Con Dao"
        expect(province_2.time2).to eq "Not yet"
      end
    end

  end
end
