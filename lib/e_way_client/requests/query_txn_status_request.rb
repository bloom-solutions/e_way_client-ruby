module EWayClient
  class QueryTxnStatusRequest < BaseRequest

    attribute :agent_code, String
    attribute :username, String
    attribute :password, String
    attribute :transaction_id, String

    MESSAGE_ATTRS = %i[
      agent_code
      username
      password
      transaction_id
    ]

    private

    def default_message
      MESSAGE_ATTRS.each_with_object({}) do |attr, hash|
        hash[attr.to_s.upcase] = send(attr)
      end
    end

  end
end
