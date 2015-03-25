$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'lib/click_it'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :default => :spec do

end

task :which_university, :url do |t, args|
  if args[:url]
    ClickIt.which_university args[:url]
  else
    ClickIt.which_university
  end
end