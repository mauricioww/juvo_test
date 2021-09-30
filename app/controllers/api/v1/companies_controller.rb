class Api::V1::CompaniesController < Api::V1::ApiV1Controller
  include AvailableCountriesConcern

  before_action :available_country?
  before_action :load_json!
  
  def index
  end
  
  private

  def load_json!
    path = Rails.root.join('app', 'resources', "#{country_params[:country]}.json").to_s
    file = File.read(path)
    @json = JSON.parse(file)
  end
end