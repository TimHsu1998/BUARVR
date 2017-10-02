class AddIntroToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :intro, :text
  end
end
