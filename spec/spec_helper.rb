#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# loading common gems
require 'rubygems'
require 'fileutils'
require 'yaml'
require_relative '../props'

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# setting up the global configuration
RSpec.configure do |config|
    config.color = true # Use color in STDOUT
    config.tty = true   # Use color not only in STDOUT but also in pagers and files
    config.formatter = :documentation # Use the specified formatter (:progress, :html, :textmate)
    config.after(:all){ FileUtils.remove(Dir.glob('*.yml')) }
end

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# loading lib files
helpers_path = File.join(Dir.pwd, 'lib', 'helpers')

[File.join(helpers_path,'*helper_spec.rb') # regex for all the helpers files (ending with "_helper_spec.rb")
].each do | regex_files |
    Dir.glob(regex_files).each{ |f| require f }
end
