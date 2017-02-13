module EWayClient
  class Client

    include APIClientBase::Client.module(default_opts: :default_opts)

    include Virtus.model
    attribute :wsdl, String, default: "https://ws.remit.vn/ws.asmx?WSDL"
    attribute :username, String
    attribute :password, String
    attribute :secret, String
    attribute :log, Boolean, lazy: true, default: false
    attribute :logger, Object, lazy: true, default: :default_logger

    api_action :query_list_banks
    api_action :query_list_provinces
    api_action :send_transaction
    api_action :query_txn_status, args: [:transaction_id]

    private

    def default_opts
      %i[wsdl username password secret log logger].each_with_object({}) do |attr, hash|
        hash[attr] = send(attr)
      end
    end

    def default_logger
      Logger.new(STDOUT)
    end

  end
end
