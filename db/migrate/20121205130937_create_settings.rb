class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :title
      t.text :blurb
      t.string :email
      t.string :phone
      t.string :description

      t.timestamps
    end
  end
end
