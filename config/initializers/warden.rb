Rails.configuration.middleware.use RailsWarden::Manager do |manager|
  manager.default_strategies :password
  manager.failure_app = UserSessionsController
end

class Warden::SessionSerializer
  def serialize(user)
    user.id
  end

  def deserialize(key)
    User.criteria.id(key).first
  end
end

## Declare your strategies here
Warden::Strategies.add(:password) do
  
  def valid?
    params[:email] || params[:password]
  end

  def authenticate!
    u = User.authenticate(params[:email], params[:password])
    u.nil? ? fail!("Could not log in") : success!(u)
  end
  
end