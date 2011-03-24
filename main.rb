BASE_URI = "https://github.com/RobertoBarros/new_app_template/raw/master/files"

run "wget --no-check-certificate '#{BASE_URI}/GemFile' -O GemFile"

run "bundle install"


git :init
git :add => '.'
git :add => 'public/javascripts/rails.js --force'
git :commit => '-am "Initial commit"'

