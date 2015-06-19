class CreateUserService
  def call(email)
    user = User.find_or_create_by!(email: email) do |user|
        user.password = Rails.application.secrets.user_password
        user.password_confirmation = Rails.application.secrets.user_password
        user.confirm!
        user.user!
      end
  end
end
