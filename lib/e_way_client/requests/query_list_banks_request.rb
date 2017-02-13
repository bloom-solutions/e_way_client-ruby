module EWayClient
  class QueryListBanksRequest < BaseRequest

    private

    def default_message
      {
        "USERNAME" => username,
        "PASSWORD" => password,
      }
    end

  end
end
