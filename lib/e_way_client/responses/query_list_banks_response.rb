module EWayClient
  class QueryListBanksResponse < BaseResponse

    attribute :data, Object, lazy: true, default: :default_data
    attribute :banks, Array, lazy: true, default: :default_banks

    private

    def default_data
      raw_response.body.deep_fetch(*%i[
        query_list_banks_response
        query_list_banks_result
        diffgram
        document_element
        query_list_banks
      ])
    end

    def default_banks
      data.map { |hash| Bank.new(hash) }
    end

  end
end
