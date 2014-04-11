module Tracked
  class Job < ActiveRecord::Base
    self.table_name = "tracked_jobs"

    def self.generate(job_id)
      uuid = SecureRandom.uuid
      self.create!(job_id: job_id, uuid: uuid)
    end

    def start!
      self.update_attributes!(started_at: Time.now)
    end

    def succeed!(result)
      self.update_attributes!(success: true, result: result)
    end

    def fail!(result)
      self.update_attributes!(success: false, result: result)
    end

    def status
      return :created if started_at.nil?
      return :started if success.nil?
      return :success if success
      :failed
    end
  end
end
