BASE_URI = "https://github.com/RobertoBarros/new_app_template/raw/master/files"

run "wget --no-check-certificate '#{BASE_URI}/Gemfile' -O Gemfile"

run "bundle install"
