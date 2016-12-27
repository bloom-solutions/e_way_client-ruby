module EWayClient
  class BaseResponse

    include APIClientBase::Response.module
    attribute :success, Boolean, default: :default_success

  end
end
