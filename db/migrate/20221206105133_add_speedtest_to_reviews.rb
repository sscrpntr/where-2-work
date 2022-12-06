class AddSpeedtestToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :speedtest, :boolean
  end
end
