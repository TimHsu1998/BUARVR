require 'bundler'
Bundler.require

# Authenticate a session with your Service Account
session = GoogleDrive::Session.from_service_account_key("client_secret.json")

# Get the spreadsheet by its title
spreadsheet = session.spreadsheet_by_title("2017 member list")
# Get the first worksheet
worksheet = spreadsheet.worksheets.fourth
# Print out the first 6 columns of each row
worksheet.insert_rows(2, [["Hello!", "This", "was", "inserted", "via", "Ruby"]])
worksheet.save
