class AddPitureToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :picture, :string
  end
end
