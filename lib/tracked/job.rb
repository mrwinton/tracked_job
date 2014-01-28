module Tracked
  class Job < ActiveRecord::Base
    self.table_name = "tracked_jobs"

    serialize :data

    has_one :user

    def self.generate(job_id, user=nil)
      uuid = SecureRandom.uuid
      self.create(job_id: job_id, uuid: uuid, user: user)
    end

    def start!
      self.update_attributes(started_at: Time.now)
    end

    def succeed!(result)
      self.update_attributes(success: true, data: result)
    end

    def fail!(result)
      self.update_attributes(success: false, data: result)
    end
  end
end
