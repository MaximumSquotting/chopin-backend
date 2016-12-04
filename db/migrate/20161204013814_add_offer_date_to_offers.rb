class AddOfferDateToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :OfferDate, :datetime
  end
end
