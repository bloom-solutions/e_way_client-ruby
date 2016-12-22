module EWayClient
  class Bank

    include Virtus.model
    attribute :bank_id, Integer
    attribute :bank_name_eng, String
    attribute :bank_name_viet, String
    attribute :response_code, String

  end
end
