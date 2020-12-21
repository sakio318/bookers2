class AddPostalcodePrefecturecodeCityStreetToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :postalcode, :integer
    add_column :users, :prefecturecode, :string
    add_column :users, :city, :string
    add_column :users, :street, :string
  end
end
