class AddIndexToProperties < ActiveRecord::Migration[7.0]
  def change
    def change
      add_index :properties, :vic_lga_id
    end
    
  end
end
