class PagesController < ApplicationController
  before_action :require_login, only: [:secret]

  def index
  end

  def secret
    render :index
  end
end
