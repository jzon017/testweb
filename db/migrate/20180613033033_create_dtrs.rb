class CreateDtrs < ActiveRecord::Migration[5.2]
  def change
    create_table :dtrs do |t|
      t.string :gName
      t.string :lName
      t.string :wAssigned
      t.datetime :timein
      t.datetime :timeout

      t.timestamps
    end
  end
end
