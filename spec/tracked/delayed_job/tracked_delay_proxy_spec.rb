require 'spec_helper'

describe Tracked::DelayedJob::Plugin do

  before do
    mock_model('MockModel')
    MockModel.any_instance.stub(:calculate) { "result" }
  end

  let(:stub_object) { MockModel.new }

  it "should create a tracked_job when calling tracked_delay" do
    expect {
      stub_object.tracked_delay.calculate
    }.to change { Tracked::Job.count }.from(0).to(1)
  end

  it "should return the created tracked_job uuid" do
    SecureRandom.stub(:uuid) { "uuid" }
    result = stub_object.tracked_delay.calculate
    expect(result).to eq "uuid"
  end
end
