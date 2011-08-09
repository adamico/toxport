class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl

  def redirect_with_flash(instance)
    redirect_to instance, :notice => flash_message(instance)
  end

  def flash_message(instance)
    @flash_message = t("flash.#{self.action_name}", :resource => t("activerecord.models.#{instance.class.name.downcase}"))
  end
end
