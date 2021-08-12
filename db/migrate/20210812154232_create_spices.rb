class CreateSpices < ActiveRecord::Migration[6.1]
  def change
    create_table :spices do |t|
      t.string :title
      t.string :image
      t.string :description
      t.string :notes
      t.float :rating

      t.timestamps
    end
  end
end


# rails g model Spice title:string image:string description:string notes:string rating:float --no-test-framework

# rails db:migrate db:seed