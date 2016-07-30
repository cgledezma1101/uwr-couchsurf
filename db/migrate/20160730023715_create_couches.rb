class CreateCouches < ActiveRecord::Migration[5.0]
  def change
    create_table :couches do |t|
      t.integer :host_id
      t.string :description
      t.string :host_comments
      t.string :occupant_name
      t.string :occupant_phone
      t.string :occupant_email
      t.string :occupant_comments

      t.timestamps
    end
  end
end
