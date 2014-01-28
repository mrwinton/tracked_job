require "spec_helper"

describe Tracked::Job do

  # let(:user) {FactoryGirl.create(:user)}
  # let(:program) {FactoryGirl.create(:program)}
  let(:job_id) { 1 }

  it "should be able to create" do
    tracked_job = Tracked::Job.generate(job_id)
    expect(tracked_job).not_to be_nil
    expect(tracked_job.id).not_to be_nil
    expect(tracked_job.uuid).not_to be_nil
  end

  it "should be able to create" do
    tracked_job = Tracked::Job.generate(job_id)
    expect(tracked_job).not_to be_nil
    expect(tracked_job.id).not_to be_nil
    expect(tracked_job.uuid).not_to be_nil
  end

  it "should be possible to start" do
    tracked_job = Tracked::Job.generate(job_id)
    tracked_job.start!
    expect(tracked_job.started_at).not_to be_nil
  end

  it "should be possible to succeed" do
    tracked_job = Tracked::Job.generate(job_id)
    tracked_job.succeed!("something")
    tracked_job.reload
    expect(tracked_job.success).to be_true
    expect(tracked_job.data).to eq "something"
  end

  it "should be possible to succeed and save program" do
    object = Tracked::Job.generate(10)

    tracked_job = Tracked::Job.generate(job_id)
    tracked_job.succeed!(object)
    tracked_job.reload
    expect(tracked_job.success).to be_true
    expect(tracked_job.data).to eq object
  end

  it "should be possible to fail" do
    tracked_job = Tracked::Job.generate(job_id)
    tracked_job.fail!("error")
    expect(tracked_job.success).not_to be_true
    expect(tracked_job.data).to eq "error"
  end

end
