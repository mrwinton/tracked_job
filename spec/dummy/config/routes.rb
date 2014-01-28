Rails.application.routes.draw do

  mount TrackedJob::Engine => "/tracked"
end
