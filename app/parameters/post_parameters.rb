class PostParameters < ActionParameter::Base
  def permit
    params.require(:post).permit(:content, :image, socialposts_attributes: [:installed_app_id] )
  end
end