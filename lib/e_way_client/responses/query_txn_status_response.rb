module EWayClient
  class QueryTxnStatusResponse < BaseResponse

    SUCCESS_RESPONSE_CODE = "0000"

    attribute(:response_code, String, {
      lazy: true,
      default: :default_response_code,
    })
    attribute(:error_message, String, {
      lazy: true,
      default: :default_error_message,
    })
    attribute(:transaction_status, String, {
      lazy: true,
      default: :default_transaction_status,
    })
    attribute(:cancel_reason, String, {
      lazy: true,
      default: :default_cancel_reason,
    })

    private

    def default_success
      response_code == SUCCESS_RESPONSE_CODE
    end

    def default_response_code
      data[:response_code]
    end

    def default_error_message
      "#{response_code}: unknown description"
    end

    def default_transaction_status
      data[:transaction_status]
    end

    def default_cancel_reason
      data[:cancel_reason]
    end

  end
end
