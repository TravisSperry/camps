require "application_responder"

class ApplicationController < ActionController::Base
  before_action :set_locations
  before_action :set_camps
  self.responder = ApplicationResponder
  respond_to :html
  protect_from_forgery
  force_ssl if: :ssl_configured?

  def ssl_configured?
    !Rails.env.development?
  end

  def set_locations
    @locations = Location.all
  end

  def set_camps
    # @activecamps = Camp.activecamps.sort_by! {|a| a.title}
    # @onlinecamps = Camp.onlinecamps.sort_by! {|a| a.id}
    @activecamps = []
    @onlinecamps = []
  end
end
