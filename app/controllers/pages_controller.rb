class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :survey]

  def home
  end

  def bio
  end

  def survey
  end

  def ressources
  end
end
