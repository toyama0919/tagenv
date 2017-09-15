require 'aws-sdk'
require_relative 'tag_util'

module Tagenv
  module Ec2
    class Tag
      def initialize
        @logger = Logger.new(STDOUT)
        region = ENV['AWS_REGION'] || Metadata.get_document['region']
        @ec2 = Aws::EC2::Client.new(region: region)
      end

      def get_tag_hash(instance_id: nil)
        instance_id = instance_id || Metadata.get_instance_id
        instances_tag_with_id(instance_id)
      end

      private

      def instances_tag_with_id(instance_id)
        tags = @ec2.describe_instances(
          instance_ids: [instance_id]
        ).data.to_h[:reservations].map { |instance| instance[:instances].first }.first[:tags]
        TagUtil.convert_tag_hash(tags)
      end
    end
  end
end
