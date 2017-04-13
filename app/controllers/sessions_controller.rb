class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to :profile
    end
  end

  def create
    if params[:name].present?
      session[:name] = params[:name]
      redirect_to :profile
    else
      redirect_to :login
    end
  end

  def show
    @current_user = current_user
  end

  def destroy
    session[:name] = nil
    redirect_to login_path
  end
  private

  def logged_in?
    session.include? :name
  end
end
