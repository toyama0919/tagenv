require 'spec_helper'
require 'tagenv'

describe Tagenv::CLI do
  before do
  end

  it "should stdout help" do
    output = capture_stdout do
      Tagenv::CLI.start(['help'])
    end
    expect(output).not_to eq(nil)
  end

  it "include" do
    output = capture_stdout do
      Tagenv::CLI.start(['help', 'load'])
    end
    expect(output).to include('--provider')
    expect(output).to include('--instance-id')
    expect(output).to include('--prefix')
  end

  after do
  end
end
