class AddTypeToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :type_id, :integer
  end
end
