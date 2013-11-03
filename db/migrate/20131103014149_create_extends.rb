class CreateExtends < ActiveRecord::Migration
  def change
    create_table :extends do |t|
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
