require 'spec_helper'

module EWayClient
  RSpec.describe Bank, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:bank_id, Integer) }
      it { is_expected.to have_attribute(:bank_name_eng, String) }
      it { is_expected.to have_attribute(:bank_name_viet, String) }
      it { is_expected.to have_attribute(:response_code, String) }
    end

  end
end
