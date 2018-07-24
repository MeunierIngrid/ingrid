class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :survey]

  def home
    render :layout => false
  end

  def survey
  end
end
