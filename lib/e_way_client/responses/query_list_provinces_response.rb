module EWayClient
  class QueryListProvincesResponse < BaseResponse

    attribute :provinces, Array, lazy: true, default: :default_provinces

    private

    def default_provinces
      data.map { |hash| Province.new(hash) }
    end

  end
end
