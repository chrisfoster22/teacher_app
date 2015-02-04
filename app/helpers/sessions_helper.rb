module SessionsHelper
  def log_in(teacher)
  session[:user_id] = user.id
  end
end
