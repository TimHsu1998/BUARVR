class CreateEmailinglists < ActiveRecord::Migration[5.1]
  def change
    create_table :emailinglists do |t|
      t.string :email
      t.string :name
      t.timestamps
    end
  end
end
