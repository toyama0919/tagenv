require "thor"

module Tagenv
  class CLI < Thor

    map '--version' => :version
    default_task :load

    def initialize(args = [], options = {}, config = {})
      super(args, options, config)
      @global_options = config[:shell].base.options
    end

    desc 'load', 'load'
    option :prefix, aliases: '-p', default: 'EC2TAG_',type: :string, desc: 'prefix'
    option :instance_id, aliases: '-i', type: :string, desc: 'instance_id'
    option :provider, type: :string, default: 'ec2', desc: 'provider'
    option :print, aliases: '-P', type: :boolean, desc: 'print'
    def load
      Tagenv.load(
        prefix: options[:prefix],
        instance_id: options[:instance_id],
        provider: options[:provider]
      )
      p ENV if options[:print]
    end

    desc 'version', 'show version'
    def version
      puts VERSION
    end
  end
end
