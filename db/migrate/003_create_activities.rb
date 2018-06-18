
class CreateActivities < ActiveRecord::Migration[4.2]
  def change
    create_table :activities do |t|
      t.string :status #accepted/done or rejected (I think marking it as already done might be something for later, but let me know)
      t.string :name
      t.string :description
      t.integer :physical_intensity #1-5
      t.integer :mental_intensity #1-5
      t.integer :fun_index #1-5
      t.integer :duration_in_minutes
      t.string :necessary_location #I occured to me that we can just indicate a necessary location (work or home) and leave this nil if no location is necessary for the possibility
      t.boolean :others_required #I've set this up as a boolean, just to indicate if others are required or not. I think in the simple, first version of this, that might be all we should do.
      t.integer :user_id
      t.integer :possibility_id
      t.integer :rating
      t.timestamps
    end
  end
end
