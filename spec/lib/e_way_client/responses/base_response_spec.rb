require 'spec_helper'

module EWayClient
  RSpec.describe BaseResponse, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:success) } # Boolean
    end

    describe "#data" do
      before do
        class QuerySomethings < BaseResponse

        end
      end

      context "`document_element` key exists" do
        let(:raw_response) do
          double(body: {
            query_somethings_response: {
              query_somethings_result: {
                diffgram: {
                  document_element: {
                    query_somethings: [1, 2]
                  }
                }
              }
            }
          })
        end
        let(:response) { QuerySomethings.new(raw_response: raw_response) }

        it "is the data found in the deeply nested hash for the action" do
          expect(response.data).to match_array([1, 2])
        end
      end

      context "`document_element` key does not exist" do
        let(:raw_response) do
          double(body: {
            query_somethings_response: {
              query_somethings_result: {
                diffgram: { }
              }
            }
          })
        end

        let(:response) { QuerySomethings.new(raw_response: raw_response) }

        it "is the data found in the deeply nested hash for the action" do
          expect(response.data).to be_nil
        end
      end
    end

  end
end
