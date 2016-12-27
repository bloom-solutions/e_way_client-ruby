module EWayClient
  class QueryListProvincesResponse < BaseResponse

    attribute :data, Object, lazy: true, default: :default_data
    attribute :provinces, Array, lazy: true, default: :default_provinces

    private

    def default_data
      raw_response.body.deep_fetch(*%i[
        query_list_provinces_response
        query_list_provinces_result
        diffgram
        document_element
        query_list_provinces
      ])
    end

    def default_provinces
      data.map { |hash| Province.new(hash) }
    end

  end
end
