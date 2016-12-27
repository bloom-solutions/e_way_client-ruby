module EWayClient
  class BaseResponse

    include APIClientBase::Response.module
    attribute :success, Boolean, lazy: true, default: :default_success

  end
end
