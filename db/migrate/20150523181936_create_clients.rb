class CreateClients < ActiveRecord::Migration
  def change
    create_table(:clients) do |t|
      t.column(:name, :string)
    end
  end
end
