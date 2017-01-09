module EWayClient
  class BaseResponse

    include APIClientBase::Response.module
    attribute :success, Boolean, lazy: true, default: :default_success
    attribute :data, Object, lazy: true, default: :default_data

    private

    def default_data
      raw_response.body.deep_fetch(
        :"#{action_slug}_response",
        :"#{action_slug}_result",
        :diffgram,
        :document_element,
        action_slug,
      ) { nil }
    end

    def action_slug
      self.class.name.demodulize.gsub("Response", "").underscore.to_sym
    end

  end
end
