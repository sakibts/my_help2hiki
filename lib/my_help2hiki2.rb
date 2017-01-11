require "my_help2hiki/version"
require "optparse"
require "yaml"
require "fileutils"
require "systemu"
require "coderay"
#require "my_help"

module MyHelp2hiki
  class Command

    def self.run(argv=[])
      new(argv).execute
    end 
  
    def initializer(argv=[])
      @argv = argv
      @local_help_my_help = File.join(ENV['HOME'],'.my_help2hiki')
      @local_help_hiki = File.join(ENV['HOME'],'~/Sites/hiki-1.0/data/text')
    end

    def execute
      @argv << '--help' if @argv.size==0
      command_parser = OptionParser.new do |opt|
      opt.on('-v', '--version','show program Version.'){ |v|
        opt.version = MyHelp2hiki::VERSION
        puts opt.ver
      }
      opt.on('--view [item]','view text'){|item| view(item)}
    end
    begin
      command_parser.parse!(@argv)
    rescue=> eval
      p eval
    end
    exit
    end
  end
end 
