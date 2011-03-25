BASE_URI = "https://github.com/RobertoBarros/new_app_template/raw/master/files"


run "rm -Rf .gitignore public/index.html public/javascripts/* test app/views/layouts/*"


run "wget --no-check-certificate '#{BASE_URI}/GemFile' -O GemFile"
run "bundle install"

plugin 'asset_packager', :git => 'git://github.com/sbecker/asset_packager.git'

application  <<-GENERATORS
config.generators do |g|
  g.template_engine :haml
end
GENERATORS

generate "devise:install"
generate "devise User"

run "compass init --using blueprint --app rails --css-dir public/stylesheets --sass-dir app/stylesheets"
run "rm public/stylesheets/*"

run "wget --no-check-certificate 'https://github.com/rails/jquery-ujs/raw/master/src/rails.js' -O public/javascripts/rails.js"
run "wget --no-check-certificate '#{BASE_URI}/application.html.haml' -O app/views/layouts/application.html.haml"
run "wget --no-check-certificate '#{BASE_URI}/gitignore' -O .gitignore"
run "wget --no-check-certificate '#{BASE_URI}/screen.scss' -O app/stylesheets/screen.scss"
run "wget --no-check-certificate '#{BASE_URI}/print.scss' -O app/stylesheets/print.scss"
run "wget --no-check-certificate '#{BASE_URI}/asset_packages.yml' -O config/asset_packages.yml"

append_file 'config/environment.rb', <<-ASSET_PACKAGER

  Synthesis::AssetPackage.merge_environments = %w(staging production)
ASSET_PACKAGER


git :init
git :add => '.'
git :commit => '-am "Initial commit"'

