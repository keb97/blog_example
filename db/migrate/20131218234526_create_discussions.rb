class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.text :comment
      t.references :user, index: true
      t.references :article, index: true

      t.timestamps
    end
  end
end
