class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :category, null: false, default: ""
      t.string :location, null: false, default: ""
      t.string :details, null: false, default: ""


      t.timestamps
    end
  end
end
