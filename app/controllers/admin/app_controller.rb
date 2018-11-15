module Admin
  class AppController < ActionController::Base
    layout 'admin_zurb'
    #before_action :authenticate_manager!
  end
end