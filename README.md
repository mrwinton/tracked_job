Tracked::Job
============

[gem]: https://rubygems.org/gems/tracked_job

Tracked::Job keeps track of tasks executing in the background.

Currently supports integration with [delayed_job](https://github.com/collectiveidea/delayed_job/)


Installation
============
tracked_job 0.0.1 only supports Rails 4.0+.

Add `tracked_job` to your `Gemfile`.

```ruby
gem 'tracked_job'
```

Run `bundle install` to install.


The Active Record backend requires a tracked_jobs table. You can create that table by
running the following command:

    rake tracked_job:install:migrations
    rake db:migrate


Add the Tracked::DelayedJob::Plugin to hook into delayed jobs:

```ruby
# config/initializers/delayed_job_config.rb (Or similiar)
Delayed::Worker.plugins << Tracked::DelayedJob::Plugin
```

Tracking Queued Jobs
============
Call `.tracked_delay.method(params)` on any object and it will track the job that is beign processed in the background.

```ruby
# without delayed_job
@user.activate!(@device)

# with delayed_job
@user.delay.activate!(@device)

# with tracked_job tracking the delayed_job
@user.tracked_delay.activate!(@device)
```
