module Tracked
  module DelayedJob
    class Plugin < Delayed::Plugin
      module Perform
        def perform
          @tracked_job.start!
          begin
            result = super
          rescue Exception => exception
            @tracked_job.fail!(exception.message)
            raise
          end
          @tracked_job.succeed!(result)
          return result
        end
      end

      callbacks do |lifecycle|
        lifecycle.before(:invoke_job) do |job|
          tracked_job = Tracked::Job.find_by(job_id: job.id)
          if tracked_job.present?
            payload = job.payload_object
            payload.instance_variable_set(:@tracked_job, tracked_job)
            payload.extend Perform
          end
        end
      end
    end
  end
end
