class PagesController < ApplicationController
  def home
    @organisations = Organisation.all
    @organisation = Organisation.new
    redirect_to login_path unless user_signed_in?
  end
end
