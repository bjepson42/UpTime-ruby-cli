
class CreateActivities < ActiveRecord::Migration[4.2]
  def change
    create_table :activities do |t|
      t.string :status #accepted/done or rejected (I think marking it as already done might be something for later, but let me know)
      t.integer :user_id
      t.integer :possibility_id
      t.integer :rating
      t.timestamps
    end
  end
end
