class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.string :name, null: false, default: ""
      t.string :description, null: false, default: ""
      t.integer :cost_per_person
      t.integer :max_number_of_people
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
