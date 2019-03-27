class HomepageController < ApplicationController

  def home
    
  end
  
  def search
    search_bar = params[:search_bar] || session[:search_bar]
    search_type = params[:search_type] || session[:search_type]
    case search_type
    when 'food'
      redirect_value = 'food'
    when 'restaurant'
      redirect_value = 'restaurant'
    end
    if search_bar.empty?
      redirect_to '/'
    else
      session[:search_bar] = search_bar
      redirect_to controller: 'search', action: redirect_value, search_bar: search_bar
    end
  end
  
end