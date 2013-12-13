$:.unshift File.dirname('prct09_spec.rb') + './lib/*'

require 'rake'
require 'rspec/core/rake_task'
require 'rdoc/task'

RSpec::Core::RakeTask.new

task :default => :spec


        desc "run rspec tests and documentation"
        task :doc do
                sh "rspec -Ilib ./lib/* -Ispec spec/prct09_spec.rb --format documentation"
        end
        
        desc "build HTML"
        task :html do
                sh "rspec -Ilib ./lib/* -Ispec spec/prct09_spec.rb --format html > pruebas.html"
        end

	desc "build documentarion"
        task :rdoc do
                sh "rdoc -a -o documentation"
        end

