module EWayClient
  class Client

    include APIClientBase::Client.module(default_opts: :default_opts)

    include Virtus.model
    attribute :wsdl, String, default: "https://ws.remit.vn/ws.asmx?WSDL"
    attribute :username, String
    attribute :password, String
    attribute :secret, String

    api_action :query_list_banks
    api_action :query_list_provinces
    api_action :send_transaction

    private

    def default_opts
      %i[wsdl username password secret].each_with_object({}) do |attr, hash|
        hash[attr] = send(attr)
      end
    end

  end
end
