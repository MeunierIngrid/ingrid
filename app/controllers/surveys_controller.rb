class SurveysController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    raise
  end

  def create
  end

  def show
  end
end
