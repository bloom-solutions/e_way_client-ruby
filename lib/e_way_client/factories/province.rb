FactoryBot.define do

  factory :e_way_client_province, class: "EWayClient::Province" do
    sequence(:province_id) {|n| n}
    sequence(:province_name_eng) {|n| "Eng province #{n}"}
    sequence(:province_name_viet) {|n| "Viet province #{n}"}
    response_code { "0000" }
  end

end
