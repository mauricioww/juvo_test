class Api::V1::CompaniesController < Api::V1::ApiV1Controller
  include AvailableCountriesConcern

  before_action :available_country?

  def index

  end
  
end