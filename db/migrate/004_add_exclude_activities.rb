class AddExcludeActivities< ActiveRecord::Migration

  def change
    add_column :activities, :exclude, :boolean, default: false
  end
end 
