class CreateExternalResources < ActiveRecord::Migration[6.0]
  def change
    create_table :external_resources do |t|
      t.string :name
      t.string :link, index: {unique: true}
      t.string :tags, array: true, default: [], null: false
      t.string :languages, array: true, default: [], null: false
      t.boolean :published, default: :false

      t.timestamps
    end
  end
end
