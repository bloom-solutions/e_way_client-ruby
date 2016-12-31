FactoryGirl.define do

  factory :e_way_client_bank, class: "EWayClient::Bank" do
    sequence(:bank_id) {|n| n}
    sequence(:bank_name_eng) {|n| "Eng Bank #{n}"}
    sequence(:bank_name_viet) {|n| "Viet Bank #{n}"}
    response_code "0000"
  end

end
