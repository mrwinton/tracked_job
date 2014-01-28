require 'spec_helper'

describe Tracked::Hooks::DelayedJob do
  let(:program) { FactoryGirl.create(:program) }

  it "should create a tracked_job when calling tracked_delay" do
    expect {
      program.tracked_delay.display_mode
    }.to change { TrackedJob.count }.from(0).to(1)
  end

  it "should start the tracked_job when worker start job" do
    program.tracked_delay.display_mode
    tracked_job = TrackedJob.first

    expect {
      Delayed::Worker.new.work_off
      tracked_job.reload
    }.to change { tracked_job.started_at }
  end

  it "should succeed the tracked_job when the job is done" do
    program.tracked_delay.display_mode
    tracked_job = TrackedJob.first

    expect {
      Delayed::Worker.new.work_off
      tracked_job.reload
    }.to change { tracked_job.success }.to(true)

    expect(tracked_job.data).to be_a program.display_mode.class
  end

  it "should fail the tracked_job if job has an error" do
    Program.any_instance.stub(:display_mode) { raise TypeError.new("error") }
    program.tracked_delay.display_mode
    tracked_job = TrackedJob.first

    expect {
      Delayed::Worker.new.work_off
      tracked_job.reload
    }.to change { tracked_job.success }.to(false)

    expect(tracked_job.data).to be_a TypeError
  end
end
