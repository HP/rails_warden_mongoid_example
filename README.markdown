# RailsWarden example using Mongoid
created by: http://github.com/HP 

User Model based on [Clearance](http://github.com/thoughtbot/clearance/). 
Example Application based on [Authlogic Example App](http://github.com/binarylogic/authlogic_example).

[RailsWarden](http://github.com/hassox/rails_warden) provides a wrapper to [Warden](http://github.com/hassox/warden): Warden provides a mechanism for authentication in Rack based Ruby applications. It’s made with multiple applications sharing within the same rack instance in mind.

Helper Methods defined by RailsWarden:
- Access Warden: `warden`
- Check if user is logged in: `logged_in?`, `authenticated?`
- Access logged in user: `current_user`, `user`
- Set logged in user: `current_user=`, `user=`

Controller Methods:
- Authenticate: `authenticate`
- Authenticate with error/redirect: `authenticate!`
- Log out: `logout`

