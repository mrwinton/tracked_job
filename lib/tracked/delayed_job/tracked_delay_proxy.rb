module Delayed
  class TrackedDelayProxy < Delayed::DelayProxy
    def method_missing(method, *args)
      job = super
      tracked_job = ::Tracked::Job.generate(job.id)
      tracked_job
    end
  end

  module MessageSending
    def tracked_delay(options = {})
      TrackedDelayProxy.new(PerformableMethod, self, options)
    end
  end
end
