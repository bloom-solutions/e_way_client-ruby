module EWayClient
  class SendTransactionRequest < BaseRequest

    attribute :agent_code, String
    attribute :username, String
    attribute :password, String
    attribute :transaction_id, String
    attribute :transaction_date, Time
    attribute :degit_code, String
    attribute :transaction_amount, Integer
    attribute :sett_amount, Integer
    attribute :transaction_currency, String
    attribute :sett_currency, String
    attribute :sett_conversion_rate, Float
    attribute :paymentmode, String
    attribute :sender_name, String
    attribute :sender_address, String
    attribute :sender_district, String
    attribute :sender_city, String
    attribute :sender_country, String
    attribute :sender_question, String
    attribute :sender_answer, String
    attribute :receiver_name, String
    attribute :receiver_address, String
    attribute :receiver_wards, String
    attribute :receiver_district, String
    attribute :receiver_city, String
    attribute :receiver_phone, String
    attribute :hours_receive, String
    attribute :bank_id, String
    attribute :bank_account_number, String
    attribute :transaction_message, String
    attribute(:transaction_key, String, {
      lazy: true,
      default: :default_transaction_key,
    })
    attribute :bankbranch_name, String
    attribute :bankbranch_address, String
    attribute :secret, String

    MESSAGE_ATTRS = %i[
      agent_code
      username
      password
      transaction_id
      transaction_date
      degit_code
      transaction_amount
      sett_amount
      transaction_currency
      sett_currency
      sett_conversion_rate
      paymentmode
      sender_name
      sender_address
      sender_district
      sender_city
      sender_country
      sender_question
      sender_answer
      receiver_name
      receiver_address
      receiver_wards
      receiver_district
      receiver_city
      receiver_phone
      hours_receive
      bank_id
      bank_account_number
      transaction_message
      transaction_key
      bankbranch_name
      bankbranch_address
    ]

    def transaction_date
      return nil if super.nil?
      super.in_time_zone("Bangkok").strftime("%m/%d/%Y %H:%M:%S")
    end

    private

    def default_message
      MESSAGE_ATTRS.each_with_object({}) do |attr, hash|
        hash[attr.to_s.upcase] = send(attr)
      end
    end

    def default_transaction_key
      joined_str = [transaction_amount, paymentmode, secret].join
      Digest::MD5.hexdigest(joined_str)
    end

  end
end
