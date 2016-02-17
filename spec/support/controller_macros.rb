module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = create(:user)
      sign_in @user
    end
  end

  def attributes_with_foreign_keys(*args)
    build(*args).attributes.delete_if do |k, v|
      ["id", "type", "created_at", "updated_at"].member?(k)
    end
  end

  RSpec.configure do |config|
  config.include ControllerMacros, :type => :controller
end

end
