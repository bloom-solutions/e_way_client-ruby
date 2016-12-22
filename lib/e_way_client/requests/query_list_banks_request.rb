module EWayClient
  class QueryListBanksRequest < BaseRequest

    def call
      SOAPClient.(
        wsdl: wsdl,
        action: :query_list_banks,
        message: {
          "USERNAME" => username,
          "PASSWORD" => password,
        },
      )
    end

  end
end
