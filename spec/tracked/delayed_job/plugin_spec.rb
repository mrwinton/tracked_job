require 'spec_helper'

describe Tracked::DelayedJob::Plugin do

  before do
    mock_model('MockModel')
    MockModel.any_instance.stub(:calculate) { "result" }
  end

  let(:stub_object) { MockModel.new }

  it "should start the tracked_job when worker start job" do
    stub_object.tracked_delay.calculate
    tracked_job = Tracked::Job.first

    expect {
      Delayed::Worker.new.work_off
      tracked_job.reload
    }.to change { tracked_job.started_at }
  end

  it "should succeed the tracked_job when the job is done" do
    stub_object.tracked_delay.calculate

    tracked_job = Tracked::Job.first
    expect {
      Delayed::Worker.new.work_off
      tracked_job.reload
    }.to change { tracked_job.success }.to(true)
    expect(tracked_job.result).to eq "result"
  end

  it "should fail the tracked_job if job has an error" do
    MockModel.any_instance.stub(:calculate) { raise TypeError.new("error") }
    stub_object.tracked_delay.calculate
    tracked_job = Tracked::Job.first

    expect {
      Delayed::Worker.new.work_off
      tracked_job.reload
    }.to change { tracked_job.success }.to(false)

    expect(tracked_job.result).to eq "error"
  end
end
