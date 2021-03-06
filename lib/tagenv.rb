require 'tagenv/version'
require 'tagenv/constants'
require 'tagenv/ec2/metadata'
require 'tagenv/ec2/tag'
require 'tagenv/cli'

module Tagenv
  def self.load(prefix: '', instance_id: nil, provider: 'ec2')
    tag_hash = {}
    if provider == 'ec2'
      @ec2_tag = Ec2::Tag.new(prefix: prefix, instance_id: instance_id)
      tag_hash = @ec2_tag.get_tag_hash
    else
      raise "Unsupport provider [#{provider}]"
    end
    tag_hash.each do |k, v|
      ENV[k] = v
    end
  end
end
