require 'spec_helper'

RSpec.describe "SendTransaction", vcr: {record: :once} do

  let(:transaction_id) { SecureRandom.hex(6) }

  it "sends a transaction" do
    client = EWayClient.new(CONFIG)
    response = client.send_transaction(
      transaction_id: transaction_id,
      transaction_date: Time.now,
      transaction_currency: "VND",
      transaction_amount: 50_000,
      sett_amount: 50_000,
      sett_currency: "VND",
      sett_conversion_rate: 1,
      sender_name: "Thu Giang",
      sender_country: "Korea",
      receiver_name: "Tranh Luong",
      receiver_address: "123 St",
      receiver_district: "An Duong dist", # TODO Make this dynamic
      receiver_city: "Ho Chi Minh",
      paymentmode: "FT",
      bank_id: "1", # TODO Make dynamic
      bank_account_number: "0123456789",
      bankbranch_name: "Test Branch",
      bankbranch_address: "123 Testy",
    )

    expect(response).to be_success
  end

end
