class AddRequestCountToTenant < ActiveRecord::Migration
  def change
    add_column :tenants, :request_count, :integer
  end
end
