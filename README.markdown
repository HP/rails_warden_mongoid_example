# RailsWarden example using Mongoid
created by: http://github.com/HP 

User Model based on [Clearance](http://github.com/thoughtbot/clearance/). 
Example Application based on [Authlogic Example App](http://github.com/binarylogic/authlogic_example).
Layout generated with nifty_layout from [Nifty Generators](http://github.com/ryanb/nifty-generators). 

[RailsWarden](http://github.com/hassox/rails_warden) provides authentication via the [Warden](http://github.com/hassox/warden) Rack authentication framework.

Helper Methods provided by RailsWarden:
- Access Warden: `warden`
- Check if user is logged in: `logged_in?`, `authenticated?`
- Access logged in user: `current_user`, `user`
- Set logged in user: `current_user=`, `user=`

Controller Methods:
- Authenticate: `authenticate`
- Authenticate with error/redirect: `authenticate!`
- Log out: `logout`

