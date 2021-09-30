module AvailableCountriesConcern
  extend ActiveSupport::Concern

  included do
    private

    def available_country?
      if country_params[:country].present?
        unless Rails.root.join('app', 'resources', "#{params[:country]}.json").exist?
          render json: { error: "Info Not Found" }, status: 404
        end
      else
        render json: { error: "query parameter 'country' is missing" }, status: 400
      end
    end

    def country_params
      params.permit(:country)
    end
  end
end