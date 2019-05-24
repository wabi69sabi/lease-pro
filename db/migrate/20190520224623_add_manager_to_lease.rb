class AddManagerToLease < ActiveRecord::Migration[5.2]
  def change
    add_column :leases, :owner, :integer
    add_column :leases, :manager, :integer
    add_column :leases, :tenant, :integer
  end
end
