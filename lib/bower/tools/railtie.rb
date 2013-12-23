module Bower
  module Tools
    class Railtie < Rails::Railtie
      rake_tasks do
        load "tasks/bower.rake"
      end
    end
  end
end