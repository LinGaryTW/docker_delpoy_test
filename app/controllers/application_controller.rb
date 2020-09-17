class ApplicationController < ActionController::Base
  private
  skip_before_action :verify_authenticity_token
end
