class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @tools = Tool.last(4)
  end
end
