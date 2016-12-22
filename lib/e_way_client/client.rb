module EWayClient
  class Client

    include APIClientBase::Client.module(default_opts: :default_opts)

    include Virtus.model
    attribute :wsdl, String, default: "https://ws.remit.vn/ws.asmx?WSDL"
    attribute :username, String
    attribute :password, String

    api_action :query_list_banks

    private

    def default_opts
      %i[wsdl username password].each_with_object({}) do |attr, hash|
        hash[attr] = send(attr)
      end
    end

  end
end
