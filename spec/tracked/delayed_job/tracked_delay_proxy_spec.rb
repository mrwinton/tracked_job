require 'spec_helper'

describe Tracked::DelayedJob::Plugin do

  before do
    mock_model('MockModel')
    allow_any_instance_of(MockModel).to receive(:calculate).and_return("result")
  end

  let(:stub_object) { MockModel.new }

  it "should create a tracked_job when calling tracked_delay" do
    expect {
      stub_object.tracked_delay.calculate
    }.to change { Tracked::Job.count }.from(0).to(1)
  end

  it "should return the created tracked_job" do
    allow(SecureRandom).to receive(:uuid).and_return("uuid")
    tracked_job = stub_object.tracked_delay.calculate
    expect(tracked_job.uuid).to eq "uuid"
  end
end
