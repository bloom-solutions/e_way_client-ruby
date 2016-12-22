module EWayClient
  class BaseRequest

    include Virtus.model
    attribute :wsdl, String
    attribute :username, String
    attribute :password, String

  end
end
