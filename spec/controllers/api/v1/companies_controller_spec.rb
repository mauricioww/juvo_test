require 'rails_helper'

RSpec.describe "Countries", type: :request do
  describe "#index" do
    context 'with rigth request' do
      it 'fetchs the info of companies in Mexico' do
        get api_v1_companies_path, params: { country: 'mx' }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with bad request ' do
      it 'misses the query parameter: country' do
        get api_v1_companies_path, params: {}
        expect(response).to have_http_status(:bad_request)
      end

      it 'looks for no available resource' do
        get api_v1_companies_path, params: { country: 'ec' }
        expect(response).to have_http_status(:not_found)
      end 
    end
  end
end