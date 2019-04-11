class AddEmployeeIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :employee_id, :string
  end
end
