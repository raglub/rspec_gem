class CreateRspecGemModels < ActiveRecord::Migration
  def change
    create_table :rspec_gem_models do |t|
      t.string :name

      t.timestamps
    end
  end
end
