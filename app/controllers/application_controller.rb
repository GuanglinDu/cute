class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Selects a locale.
  before_action :set_locale

  protected

  def set_locale
    #lang = 'en'
    lang = 'zh_CN'
    I18n.locale = lang
  end
end
