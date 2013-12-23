namespace :bower do
  desc "Install bowerrc file"
  task :install => :environment do
    if File.exists?(Rails.root.join('.bowerrc'))
      puts ".bowerrc file already exists"
      exit
    end    
  end
end