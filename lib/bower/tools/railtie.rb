module Bower
  module Tools
    class Railtie < Rails::Railtie
      rake_tasks do
        load "tasks/bower.rake"
      end
      
      generators do
        require "bower/tools/install_generator"
      end
    end
  end
end