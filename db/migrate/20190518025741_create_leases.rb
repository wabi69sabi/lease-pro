class CreateLeases < ActiveRecord::Migration[5.2]
  def change
    create_table :leases do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.float :rent
      t.date :start_date
      t.date :end_date
      t.integer :due_date

      t.timestamps
    end

    create_join_table :leases, :users do |t|
      t.index :lease_id
      t.index :user_id
    end
  end
end
