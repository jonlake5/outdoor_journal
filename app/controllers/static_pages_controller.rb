class StaticPagesController < ApplicationController
  include SessionsHelper

  def home
      redirect_to adventures_url if signed_in?
  end

  def help
  end

  def about
  end

end
