module RakeHelpers
  def remove_default_spec_task
    Rake.application['default'].prerequisites.delete('spec') 
  end
end

include RakeHelpers
remove_default_spec_task

task :default => 'galaxy:all'

namespace :galaxy do
  stages = [:alpha, :beta, :gamma]

  task :all do
    puts "Expanding the galaxy..." + "\n" * 3

    stages.each do |stage|
      Rake::Task["galaxy:#{stage}"].invoke
    end
  end
  
  require 'rspec/core/rake_task'
  stages.each do |stage|

    RSpec::Core::RakeTask.new(stage) do |t|
      puts "DESCRIPTION OF STAGE #{stage.upcase}"
      puts

      t.rspec_opts = "--tag stage::#{stage}"
    end

  end
  
end


