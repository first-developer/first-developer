class CreateTuts < ActiveRecord::Migration
  def self.up
    create_table :tuts do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :tuts
  end
end
