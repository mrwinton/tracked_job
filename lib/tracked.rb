require 'tracked/engine'
require 'tracked/job'

if defined?(Delayed)
  require 'tracked/delayed_job/plugin'
  require 'tracked/delayed_job/tracked_delay_proxy'
end

module Tracked
end
