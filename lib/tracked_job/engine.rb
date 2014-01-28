module TrackedJob
  class Engine < ::Rails::Engine
    isolate_namespace TrackedJob
  end
end
