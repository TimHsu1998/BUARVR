class EmailinglistsController < ApplicationController
  def new
    @emailinglist = Emailinglist.new
  end

  def create
    @emailinglist = Emailinglist.new(emailinglist_params)
    if @emailinglist.save
      name = @emailinglist.name
      email = @emailinglist.email
      # Authenticate a session with your Service Account
      session = GoogleDrive::Session.from_service_account_key("client_secret.json")

      # Get the spreadsheet by its title
      spreadsheet = session.spreadsheet_by_title("2017 member list")
      # Get the first worksheet
      worksheet = spreadsheet.worksheet_by_title("Websubscription")
      # Print out the first 6 columns of each row
      worksheet.insert_rows(2, [[email, name]])
      worksheet.save
      redirect_to root_path
    end
  end

  private

  def emailinglist_params
    params.require(:emailinglist).permit(:name, :email)
  end

end
