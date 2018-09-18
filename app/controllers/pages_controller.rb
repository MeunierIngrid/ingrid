class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def bio
  end

  def survey
  end

  def ressources
  end
end
