class CreateTrackedJob < ActiveRecord::Migration
  def change
    create_table :tracked_jobs do |t|
      t.string :uuid, null: false
      t.references :user
      t.references :job, null: false
      t.boolean :success
      t.text :data
      t.datetime :started_at
      t.timestamps
    end
  end
end
