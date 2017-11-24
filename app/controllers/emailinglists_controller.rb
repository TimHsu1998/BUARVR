class EmailinglistsController < ApplicationController
  def new
    @emailinglist = Emailinglist.new
  end

  def create
    @emailinglist = Emailinglist.new(emailinglist_params)
    if @emailinglist.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def emailinglist_params
    params.require(:emailinglist).permit(:name, :email)
  end

end
