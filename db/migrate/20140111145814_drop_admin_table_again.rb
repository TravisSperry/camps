class DropAdminTableAgain < ActiveRecord::Migration
  def up
    drop_table :admins
  end

  def down
    raise ActiveRecord::IrreversibleMigratio
  end
end
