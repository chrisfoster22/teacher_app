module SessionsHelper
  def log_in(teacher)
  session[:teacher_id] = teacher.id
  end

  def current_user
  @current_user ||= Teacher.find_by(id: session[:id])
  end

  def log_out
    session.delete(:teacher_id)
    @current_user = nil
  end
end
