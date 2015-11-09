class ApplicationController < ActionController::Base
  before_action :set_last_seen_at, if: proc { signed_in? && (session[:last_seen_at] == nil || session[:last_seen_at] < 1.minutes.ago) }

  protect_from_forgery with: :exception
  include SessionsHelper

  private
    def set_last_seen_at
      current_user.update_attribute(:last_seen_at, Time.now)
      session[:last_seen_at] = Time.now
    end
end
