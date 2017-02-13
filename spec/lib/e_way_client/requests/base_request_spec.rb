require 'spec_helper'

module EWayClient
  RSpec.describe BaseRequest, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:wsdl, String) }
      it { is_expected.to have_attribute(:username, String) }
      it { is_expected.to have_attribute(:password, String) }
    end

  end
end
