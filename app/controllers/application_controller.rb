class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth
  before_action :search_item


  def search
    @buy = Buy.all
    @results = @p.result
    # binding.pry
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  end
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def search_item
    @p = Item.ransack(params[:q])
    @category_id = Category.where.not(id: 1)
    @status_id = Status.where.not(id: 1)
    @deliveryfee_id = Deliveryfee.where.not(id: 1)
  end

end
