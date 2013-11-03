class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.references :user, index: true
      t.references :story, index: true

      t.timestamps
    end
  end
end
