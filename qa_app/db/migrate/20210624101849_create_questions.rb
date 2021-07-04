class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.boolean :solved, null: false, default: false

      t.timestamps
    end
  end
end
