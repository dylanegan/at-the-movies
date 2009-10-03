gem "fakeweb", "1.2.6", :require_as => "fake_web", :only => :test
unless ENV['HEROKU_PORT']
  gem "mechanize", "0.9.3"
end
gem "rspec", "1.2.8", :require_as => "spec", :only => :test

bundle_path "tmp/vendor"
bin_path "tmp/bin"
