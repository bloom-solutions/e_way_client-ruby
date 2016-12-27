module EWayClient
  class QueryListProvincesRequest < BaseRequest

    def call
      SOAPClient.(
        wsdl: wsdl,
        action: :query_list_provinces,
        message: {
          "USERNAME" => username,
          "PASSWORD" => password,
        },
      )
    end

  end
end
