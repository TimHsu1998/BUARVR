class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.order("start_time ASC")  
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to meetings_path
    else
      render :new
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
    @hash = Gmaps4rails.build_markers(@meeting) do |meeting, marker|
      marker.lat meeting.latitude
      marker.lng meeting.longitude
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.update(meeting_params)
      redirect_to meetings_path
    else
      render :edit
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to meetings_path
  end

  private

  def meeting_params
    params.require(:meeting).permit(:name, :intro, :address, :start_time, :end_time, :latitude, :longitude)
  end
end
