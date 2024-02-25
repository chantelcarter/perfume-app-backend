# Rails API Configurations
Rspec dependencies

- `bundle add rspec-rails`
- `rails generate rspec:install`

Devise dependencies

- `bundle add devise`
- `rails generate devise:install`

Add User Model via Devise

- `rails generate devise User`
- `rails db:migrate`

Add JWT configurations

- Add following to “Gemfile”:
  - `gem 'devise-jwt'`
  - `gem 'rack-cors'`
- Create new file in > config > initializers > named “cors.rb”
- Add following content to file:
  - ```
    Rails.application.config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3001'
        resource '*',
        headers: ["Authorization"],
        expose: ["Authorization"],
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        max_age: 600
      end
    end
    ```
- Add following Devise configurations near other mailer options to > config > environments > development.rb:
  - ```
    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
    ```
- Change logout requests via a “get” request in > config > initializers > devise.rb:
  - ```
    # Find this line:
    config.sign_out_via = :delete
    # And replace it with this:
    config.sign_out_via = :get

    # Uncomment the config.navigational_formats line and remove the contents of the array:
    config.navigational_formats = []
    ```
- Create registrations and sessions controllers to handle signups and logins:
  - Run this in terminal: `rails g devise:controllers users -c registrations sessions`
- Replace contents of the controllers with following code in > app > controllers > users > registrations_controller.rb:
  - ```
    class Users::RegistrationsController < Devise::RegistrationsController
      respond_to :json
      def create
        build_resource(sign_up_params)
        resource.save
        sign_in(resource_name, resource)
        render json: resource
      end
    end
    ```
- Replace contents of these controllers with following code in > app > controllers > users > sessions_controller.rb:
  - ```
    class Users::SessionsController < Devise::SessionsController
      respond_to :json
      private
      def respond_with(resource, _opts = {})
        render json: resource
      end
      def respond_to_on_destroy
        render json: { message: "Logged out." }
      end
    end
    ```
- Update devise routes with following code  in > config > routes.rb:
  - inside:
    ```
    Rails.application.routes.draw do
     # Place following code below here:
    end
    ```
  - place this code:
    ```
    devise_for :users,
        path: '',
        path_names: {
          sign_in: 'login',
          sign_out: 'logout',
          registration: 'signup'
        },
        controllers: {
          sessions: 'users/sessions',
          registrations: 'users/registrations'
        }
    ```
- JWT Secret Key configuration
  - generate secret key with this command in terminal: `bundle exec rails secret`
  - the command above will give you a secret code in terminal.
  - open credentials file to add secret key with this command in terminal: `EDITOR="code --wait" bin/rails credentials:edit`
  - add this underneath “secret\_key\_base” in credentials file: `jwt_secret_key: <newly-created secret key from termial>`
  - in terminal use `control + c` to save
    - \*\*\*\*\* THIS DID NOT WORK FOR ME, INFORM INSTRUCTORS ABOUT PROCESS \*\*\*\*\**
- Configure JWT to work with devide by adding this code to the  Devise configurations file in > config > initiailizers > devise.rb:
  - ```
    config.jwt do |jwt|
      jwt.secret = Rails.application.credentials.jwt_special_key
      jwt.dispatch_requests = [
        ['POST', %r{^/login$}],
      ]
      jwt.revocation_requests = [
        ['DELETE', %r{^/logout$}]
      ]
      jwt.expiration_time = 5.minutes.to_i
    end
    ```
- Create  DenyList to revoke JWT using this command in terminal: `rails generate model jwt_denylist`
- Update change method with following code:
  ```
  def change
    create_table :jwt_denylist do |t|
      t.string :jti, null: false
      t.datetime :exp, null: false
    end
    add_index :jwt_denylist, :jti
  end
  ```
  - `rails db:migrate`
- Update User model to include revocation strategy with following code in > app > models > user.rb:
  ```
  devise  :database_authenticatable, :registerable,
          :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  ```
# Perfume Model
Create Perfume model

- run this command in terminal: `rails generate resource Perfume name:string designer:string category:string top_notes:text middle_notes:text base_notes:text image:text user_id:integer`
- `rails db:migrate`

Define the relationship between User and Perfume

- Add following code in > app > models > user.rb:
  ```
    has_many :perfumes
  ```
- Add the following code in > app > models > perfume.rb:
  ```
  belongs_to :user
  ```

Add seeds for users and perfumes

- Add following code to > db > seeds.rb:

```
user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

user1_perfumes = [
  {
    name: "Accident À La Vanille",
    designer: "Jousset Parfums",
    category: "Gourmand",
    top_notes: "Vanilla",
    middle_notes: "Vanilla, Sandalwood",
    base_notes: "Vanilla, Styrax",
    image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg"
  }
]

user2_perfumes = [
  {
    name: "Roses Vanille",
    designer: "Mancera",
    category: "Gourmand",
    top_notes: "Italian Lemon",
    middle_notes: "Turkish Rose",
    base_notes: "Vanilla, White Musk, Cedar",
    image: "https://fimgs.net/mdimg/perfume/375x500.15210.jpg"
  }
]


user1_perfumes.each do |perfume|
  user1.perfumes.create(perfume)
  p "created: #{perfume}"
end

user2_perfumes.each do |perfume|
  user2.perfumes.create(perfume)
  p "created: #{perfume}"
end
```
- Run `rails db:seed` in terminal