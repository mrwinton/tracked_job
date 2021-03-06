require "spec_helper"

describe Tracked::Job do

  let(:job_id) { 1 }

  it "should be able to create" do
    tracked_job = Tracked::Job.generate(job_id)
    expect(tracked_job).not_to be nil
    expect(tracked_job.id).not_to be nil
    expect(tracked_job.uuid).not_to be nil
  end

  it "should be able to create" do
    tracked_job = Tracked::Job.generate(job_id)
    expect(tracked_job).not_to be nil
    expect(tracked_job.id).not_to be nil
    expect(tracked_job.uuid).not_to be nil
  end

  it "should be possible to start" do
    tracked_job = Tracked::Job.generate(job_id)
    tracked_job.start!
    expect(tracked_job.started_at).not_to be nil
  end

  it "should be possible to succeed" do
    tracked_job = Tracked::Job.generate(job_id)
    tracked_job.succeed!("something")
    tracked_job.reload
    expect(tracked_job.success).to be true
    expect(tracked_job.result).to eq "something"
  end

  it "should be possible to succeed and save program" do
    object = Tracked::Job.generate(10)

    tracked_job = Tracked::Job.generate(job_id)
    tracked_job.succeed!(object.to_json)
    tracked_job.reload
    expect(tracked_job.success).to be true
    expect(tracked_job.result).to eq object.to_json
  end

  it "should be possible to fail" do
    tracked_job = Tracked::Job.generate(job_id)
    tracked_job.fail!("error")
    expect(tracked_job.success).not_to be true
    expect(tracked_job.result).to eq "error"
  end

  context "#status" do
    it "should return :created when started_at is not set" do
      tracked_job = Tracked::Job.generate(job_id)
      expect(tracked_job.status).to eq :created
    end

    it "should return :started when started_at is set" do
      tracked_job = Tracked::Job.generate(job_id)
      tracked_job.start!
      expect(tracked_job.status).to eq :started
    end

    it "should return :success when success is true" do
      tracked_job = Tracked::Job.generate(job_id)
      tracked_job.start!
      tracked_job.succeed!("result")
      expect(tracked_job.status).to eq :success
    end

    it "should return :failed when success is false" do
      tracked_job = Tracked::Job.generate(job_id)
      tracked_job.start!
      tracked_job.fail!("error")
      expect(tracked_job.status).to eq :failed
    end
  end
end
