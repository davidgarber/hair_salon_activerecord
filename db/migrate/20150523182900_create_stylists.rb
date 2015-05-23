class CreateStylists < ActiveRecord::Migration
  def change
    create_table(:stylists) do |t|
      t.column(:name, :string)
    end

    add_column(:clients, :stylist_id, :integer)
  end
end
