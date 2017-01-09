module EWayClient
  class QueryListBanksResponse < BaseResponse

    attribute :banks, Array, lazy: true, default: :default_banks

    private

    def default_banks
      data.map { |hash| Bank.new(hash) }
    end

  end
end
