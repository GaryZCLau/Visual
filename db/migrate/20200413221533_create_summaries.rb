class CreateSummaries < ActiveRecord::Migration[6.0]
  def change
    create_table :summaries do |t|
      t.string :summary
      t.belongs_to :profile
      t.belongs_to :blog
      t.timestamps
    end
  end
end
