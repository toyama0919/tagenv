module Tagenv
  class Env
    def self.load(prefix: '', instance_id: nil, provider: 'ec2')
      tag_hash = {}
      if provider == 'ec2'
        @ec2_tag = Ec2::Tag.new
        tag_hash = @ec2_tag.get_tag_hash(instance_id)
      else
        raise "Unsupport provider [#{provider}]"
      end
      tag_hash.each do |k, v|
        ENV[prefix + k] = v
      end
    end
  end
end
