class CreateAssigns < ActiveRecord::Migration[5.0]
  def change
    create_table :assigns do |t|
      t.references :developer, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
