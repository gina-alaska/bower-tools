module Bower
  module Tools
    class InstallGenerator < Rails::Generators::Base
      desc "This generator creates a .bowerrc file at Rails.root"
      def create_bowerrc_file
        create_file ".bowerrc", '{
  "directory": "vendor/assets/bower_components"
}'
      end
    end
  end
end