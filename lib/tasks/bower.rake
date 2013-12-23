namespace :bower do
  desc "Install bootstrap stuff"
  task :bootstrap do
    system('bower install bootstrap')
    
    puts "You will need to add the following to the app/assets/javascripts/application.js:"
    puts "\t //= require bootstrap/dist/js/bootstrap"
    puts "You will need to add the following to the app/assets/stylesheets/application.css file with:"
    puts "\t *= require bootstrap/dist/css/bootstrap"
  end
  
  desc "Remove all contensts of bower_components and public/assets"
  task :reset => :environment do
    system("rm -r #{Rails.root.join('vendor/assets/bower_components/')}")
    system("rm -r #{Rails.root.join('public/assets/')}")
  end
  
  desc 'Fix asset paths (auto run as part of assets)'
  task :resolve_asset_paths do
    # Resolve relative paths in CSS
    Dir['vendor/assets/bower_components/**/*.css'].each do |filename|
      contents = File.read(filename)
      # http://www.w3.org/TR/CSS2/syndata.html#uri
      url_regex = /url\(\s*['"]?(?![a-z]+:)([^'"\)]*)['"]?\s*\)/

      # Resolve paths in CSS file if it contains a url
      if contents =~ url_regex
        directory_path = Pathname.new(File.dirname(filename))
          .relative_path_from(Pathname.new('vendor/assets/bower_components'))

        # Replace relative paths in URLs with Rails asset_path helper
        new_contents = contents.gsub(url_regex) do |match|
          relative_path = $1
          image_path = directory_path.join(relative_path).cleanpath
          puts "#{match} => #{image_path}"

          "url(<%= asset_path '#{image_path}' %>)"
        end

        # Replace CSS with ERB CSS file with resolved asset paths
        FileUtils.rm(filename)
        File.write(filename + '.erb', new_contents)
      end
    end
  end  

  Rake::Task['assets:precompile'].enhance ['bower:resolve_asset_paths']
end