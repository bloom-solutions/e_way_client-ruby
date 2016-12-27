require "deep_fetch"
require "active_support/core_ext/hash/indifferent_access"
require "active_support/time"
require "api_client_base"
require "soap_client"
require "e_way_client/version"
require "e_way_client/client"
require "e_way_client/models/bank"
require "e_way_client/models/province"
require "e_way_client/requests/base_request"
require "e_way_client/requests/query_list_banks_request"
require "e_way_client/requests/query_list_provinces_request"
require "e_way_client/requests/send_transaction_request"
require "e_way_client/responses/base_response"
require "e_way_client/responses/query_list_banks_response"
require "e_way_client/responses/query_list_provinces_response"
require "e_way_client/responses/send_transaction_response"

module EWayClient

  include APIClientBase::Base.module

  with_configuration do
    has :wsdl, classes: String, default: "https://ws.remit.vn/ws.asmx?WSDL"
    has :username, classes: String
    has :password, classes: String
    has :secret, classes: String
  end

end
