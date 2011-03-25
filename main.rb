BASE_URI = "https://github.com/RobertoBarros/new_app_template/raw/master/files"

run "wget --no-check-certificate '#{BASE_URI}/GemFile' -O GemFile"
run "wget --no-check-certificate '#{BASE_URI}/application.html.haml' -O app/views/layouts/application.html.haml"

run "bundle install"

application  <<-GENERATORS
config.generators do |g|
  g.template_engine :haml
end
GENERATORS

generate "devise:install"
generate "devise User"


git :init
git :add => '.'
git :commit => '-am "Initial commit"'

