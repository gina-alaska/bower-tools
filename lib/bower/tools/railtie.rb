module Bower
  module Tools
    class Railtie < Rails::Railtie
      rake_tasks do
        load "tasks/bower.rake"
      end
      
      generators do
        require "bower/tools/install_generator"
      end
      
      # Only needed in Rails 4+, it no longer pulls things from the vendor/assets directory automatically
      if Rails::VERSION::MAJOR >= 4
        config.to_prepare do
          Rails.configuration.assets.precompile << lambda do |path, filename|
            exts = %w(.sh .html .json .txt .md .js .css .license .lock .markdown .jade .map .py .yml .draw)
            exclude_paths = /\/(tests|test|doc|docs|example|examples|kitchen-sink|demo|tasks|development\-bundle|node_modules)\//
            bower_components_path = File.dirname(path).gsub(Rails.root.join('vendor/assets/bower_components').to_s, '')
            filename =~ /vendor\/assets\/bower_components/ && !File.extname(path).blank? && (bower_components_path =~ exclude_paths).nil? && !exts.include?(File.extname(path).downcase)
          end
        end
      end
    end
  end
end
