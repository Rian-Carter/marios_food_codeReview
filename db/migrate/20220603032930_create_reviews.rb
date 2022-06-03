class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.column :author, :string
      t.column :content_body, :text
      t.column :rating, :integer

      t.timestamps
    end
  end
end
