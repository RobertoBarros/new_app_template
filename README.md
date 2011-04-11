Template para novas aplicações em Rails 3
=========================================

É necessário baixar o template do GitHub para usá-lo:

    wget --no-check-certificate https://github.com/RobertoBarros/new_app_template/raw/master/main.rb -O /tmp/template.rb

Para criar um novo projeto:

    rails new app_name -JT -m /tmp/template.rb

onde app_name é o nome do projeto.

Utilizando Devise
-----------------

Defina uma root_url no `config/routes.rb`, por exemplo:

    root :to => "home#index"

Na view (neste caso em application.html.haml) adicione:

    - if user_signed_in?
      Olá  #{current_user.email}. Não é você?
      = link_to "sair", destroy_user_session_path
    - else
      = link_to "Novo ", new_user_registration_path
      ou
      = link_to " Entrar", new_user_session_path


Utilizando Devise RPX (Janrain)
----------------------------

No model de usuário criado pelo devise em `app/models/user.rb` adicionar no método devise:

    devise ..., :rpx_connectable

Adicionar a coluna `rpx_identifier` no model através de migration:

    rails generate migration AddRpxIdentifierToUsers rpx_identifier:string


No initializer do devise em `config/initializers/devise.rb` adicionar o nome da aplicação definida no RPX:

    Devise.setup do |config|
        ...
        config.rpx_application_name = "mytestingapp" # The name of your RPX application (this is the name, NOT the API key!)
    end

No `config/application.rb`, dentro da class `Application < Rails::Application` adicionar a chave RPX:

    ...
      RPXNow.api_key = "aaaabbbbbccccdddddeeeeefffff"
    ...

Adicionar a chamada javascript na View Application:

    = javascript_include_rpx(user_session_url)

e o link para abrir o popup do RPX:

    = link_to_rpx "Signin using RPX!", user_session_url


