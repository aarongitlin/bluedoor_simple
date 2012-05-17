The email_form_rails app demoes a email form (such as a contact form) in Rails. All data entered into the form is send to a specified email address, no data is saved to a database. Written relying on Rails 3.2 with ActionMailer for Sending Mails, ActiveAttr for extending ActiveModels features, ActiveModel's Validations and SimpleForm as a Form Builder, and the Slim templating language. Emails sent in development mode will be displayed in browser using LetterOpener.The deployed sample is running on Heroku's most current cedar stack.

Create a new Rails app
```
$ rails new email_form
```

Add ActiveAttr and Slim Templating Language
```
# Gemfile.rb
gem 'active_attr'
gem 'slim-rails'
```

Run Bundle Install
```
$ bundle install
or just
$ bundle
```

Message Model: Generate
```
$ rails generate model Message --skip-migration
$ Output:
      invoke  active_record
      create    app/models/message.rb
      invoke    test_unit
      create      test/unit/message_test.rb
      create      test/fixtures/messages.yml
```

Message Model: Define attributes
```
# app/models/message.rb
class Message
	# Remove the inheritance from ActiveRecord::Base (class Message < ActiveRecord::Base)

	# Include ActiveAttr functionality
	include ActiveAttr::Model

	# Define attributes
	attribute :name
	attribute :email
	attribute :phone
	attribute :body

	# Mass assignment security
	# Whitelist attributes that you want to mass assign user given data to
  	attr_accessible :name, :email, :phone, :body
end
```

```
# app/models/message.rb
class Message
		###

			# Include ActiveModel::Validations
		include ActiveModel::Validations

		###

	  # Validations
  	# Name must be present
  	validates_presence_of :name

  	# Email must be present and valid email format
  	validates_presence_of :email
  	validates :email, email_format: { message: "is not looking like a valid email address"}

  	# Phone must be present
  	validates_presence_of :phone

  	# Body is optional but if given must be 500 characters at maximum
  	validates_length_of :body, maximum: 500

end
```

Test what we've done so far in the Rails Console
```
$ rails console
or shorthand
$ rails c

$ m = Message.new
=> #<Message body: nil, email: nil, name: nil, phone: nil>
$ m.errors.full_messages
=> []
# Run validation
$ m.valid?
=> false
$ m.errors.full_messages
=> ["Name can't be blank", "Email can't be blank", "Email is not looking like a valid email address", "Phone can't be blank"]

$ m.email = "random"
=> "random"
$ m.valid?
=> false
$ m.errors.full_messages
=> ["Name can't be blank", "Email is not looking like a valid email address", "Phone can't be blank"]

$ m.email = "random@random"
=> "random@random"
$ m.valid?
=> false
$ m.errors
=> #<ActiveModel::Errors:0x007f951a7988d8 @base=#<Message body: nil, email: "random@random", name: nil, phone: nil>, @messages={:name=>["can't be blank"], :email=>["is not looking like a valid email address"], :phone=>["can't be blank"]}>
$ m.errors.full_messages
=> ["Name can't be blank", "Email is not looking like a valid email address", "Phone can't be blank"]

$ m.email = "myemail@writer.com"
=> "myemail@writer.com"
$ m.valid?
=> false
$ m.errors
=> #<ActiveModel::Errors:0x007f951a7988d8 @base=#<Message body: nil, email: "myemail@writer.com", name: nil, phone: nil>, @messages={:name=>["can't be blank"], :email=>[], :phone=>["can't be blank"]}>

# Valdation of email format seem to work properly

irb(main):035:0* m.name = "Thomas Klemm"
=> "Thomas Klemm"
irb(main):036:0> m.valid?
=> false
irb(main):037:0> m.errors
=> #<ActiveModel::Errors:0x007f951a7988d8 @base=#<Message body: nil, email: "myemail@writer.com", name: "Thomas Klemm", phone: nil>, @messages={:email=>[], :phone=>["can't be blank"]}>


