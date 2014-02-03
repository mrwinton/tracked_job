class CreateTrackedJob < ActiveRecord::Migration
  def change
    create_table :tracked_jobs do |t|
      t.string :uuid, limit: 36, null: false
      t.references :job, null: false
      t.boolean :success
      t.text :result
      t.datetime :started_at
      t.timestamps
    end

    add_index :tracked_jobs, :uuid, unique: true
    add_index :tracked_jobs, :job_id, unique: true
  end
end
