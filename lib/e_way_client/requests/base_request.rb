module EWayClient
  class BaseRequest

    SOAP_ATTRS = %i[wsdl username password log logger message action]

    include Virtus.model
    attribute :wsdl, String
    attribute :username, String
    attribute :password, String
    attribute :log, Boolean, lazy: true, default: false
    attribute :logger, Object
    attribute :message, Hash, lazy: true, default: :default_message
    attribute :action, Symbol, lazy: true, default: :default_action
    attribute(:soap_client_args, Hash, {
      lazy: true,
      default: :default_soap_client_args,
    })

    def call
      SOAPClient.(soap_client_args)
    end

    private

    def default_action
      GenActionName.(self.class)
    end

    def default_soap_client_args
      SOAP_ATTRS.each_with_object({}) do |attr, hash|
        hash[attr] = self.send(attr)
      end
    end

  end
end
