class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :survey]

  def home
  end

  def survey
  end
end
