require 'spec_helper'
require 'tagenv'

describe Tagenv::Ec2::Tag do
  before do
  end

  it "convert_tag_hash_1" do
    aws_tag_format = [
      { key: 'Name', value: 'app01' },
      { key: 'Stages', value: 'production' }
    ]
    expect_value = { 'Name' => 'app01', 'Stages' => 'production' }
    expect(Ec2::TagUtil.convert_tag_hash('', aws_tag_format)).to(eq(expect_value))
  end

  it "convert_tag_hash_2" do
    aws_tag_format = [
      { 'key' => 'Name', 'value' => 'app01' },
      { 'key' => 'Stages', 'value' => 'production' }
    ]
    expect_value = { 'Name' => 'app01', 'Stages' => 'production' }
    expect(Ec2::TagUtil.convert_tag_hash('', aws_tag_format)).to(eq(expect_value))
  end

  it "convert_tag_hash_prefix" do
    aws_tag_format = [
      { 'key' => 'Name', 'value' => 'app01' },
      { 'key' => 'Stages', 'value' => 'production' }
    ]
    expect_value = { 'EC2TAG_Name' => 'app01', 'EC2TAG_Stages' => 'production' }
    expect(Ec2::TagUtil.convert_tag_hash('EC2TAG_', aws_tag_format)).to(eq(expect_value))
  end

  after do
  end
end
