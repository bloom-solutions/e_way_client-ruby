module EWayClient
  class QueryListProvincesRequest < BaseRequest

    private

    def default_message
      {
        "USERNAME" => username,
        "PASSWORD" => password,
      }
    end

  end
end
