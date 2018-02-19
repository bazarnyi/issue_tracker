class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.string :title, null: false
      t.text :description
      t.integer :state, null: false, default: 0
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
