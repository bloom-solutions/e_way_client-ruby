module EWayClient
  class SendTransactionResponse < BaseResponse

    SUCCESS_RESPONSE_CODE = "0000"
    ERROR_MESSAGE_MAP = {
      "1001" => "Required Field is Empty",
      "1002" => "Authentication Fail",
      "1003" => "User Is Locked",
      "1004" => "Invalid Parameter",
      "1005" => "New password and confirm new password are not same",
      "1006" => "Field in request data with value not number type",
      "2003" => "Operation unsuccessful",
      "2004" => "Transaction ID does not exist",
      "2005" => "Transaction ID already exists",
      "3001" => "Invalid Payment Mode",
      "3010" => "Bank transfer account number is blank",
      "3020" => "Bank ID is blank",
      "3030" => "Incorrect bank ID",
      "3040" => "Degit code is blank",
      "3050" => "Incorrect province ID",
      "3060" => "Bank branch name is blank",
      "3070" => "Bank branch address is blank",
      "4001" => "Transaction Secure key error",
      "4002" => "The transaction was paid, should not be allowed to edit",
      "5001" => "Receiver name is blank",
      "5002" => "Receiver address is blank",
      "5003" => "Receiver district is blank",
      "5004" => "Receiver city is blank",
      "5005" => "Receiver phone is blank",
      "5006" => "Receiver wards is blank",
      "6001" => "Sender name is blank",
      "6006" => "Sender country is blank",
    }

    attribute(:response_code, String, {
      lazy: true,
      default: :default_response_code,
    })
    attribute(:error_message, String, {
      lazy: true,
      default: :default_error_message,
    })

    private

    def default_success
      response_code == SUCCESS_RESPONSE_CODE
    end

    def default_response_code
      data[:response_code]
    end

    def default_error_message
      ERROR_MESSAGE_MAP[response_code]
    end

  end
end
