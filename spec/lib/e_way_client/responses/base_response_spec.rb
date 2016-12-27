require 'spec_helper'

module EWayClient
  RSpec.describe BaseResponse, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:success) } # Boolean
    end

  end
end
