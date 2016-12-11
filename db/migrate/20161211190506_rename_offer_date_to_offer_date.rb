class RenameOfferDateToOfferDate < ActiveRecord::Migration[5.0]
  def change
      rename_column :offers, :OfferDate, :offer_date
  end
end
