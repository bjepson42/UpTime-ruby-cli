
class CreatePossibilities < ActiveRecord::Migration[4.2]
  def change
    create_table :possibilities do |t|
      t.string :name
      t.string :description
      t.integer :physical_intensity #1-5
      t.integer :mental_intensity #1-5
      t.integer :fun_index #1-5
      t.integer :duration_in_minutes
      t.string :necessary_location #I occured to me that we can just indicate a necessary location (work or home) and leave this nil if no location is necessary for the possibility
      t.boolean :others_required #I've set this up as a boolean, just to indicate if others are required or not. I think in the simple, first version of this, that might be all we should do.
      t.timestamps
    end
  end
end
