class AddAcceptedToLease < ActiveRecord::Migration[5.2]
  def change
    add_column :leases, :accepted, :boolean
  end
end
