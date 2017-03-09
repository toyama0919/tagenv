module Tagenv
  class Env
    def self.load(prefix: '', instance_id: nil)
      @ec2_tag = Ec2::Tag.new
      instance_id = instance_id || Ec2::Metadata.get_instance_id
      tag_hash = @ec2_tag.instances_tag_with_id(instance_id)
      tag_hash.each do |k, v|
        ENV[prefix + k] = v
      end
    end
  end
end
