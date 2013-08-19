module ApplicationHelper
  def display_user_logged_tag
    content_tag :div, class: 'user-logged' do
      t('.welcome', user: current_user.try(:name))
    end
  end

#   def display_user_image(user)
#     content_tag :div, class: 'user-photo' do
#       if user.image
#     end
#   end

  def display_warden_message_tag
    content_tag :div, class: 'alert' do
      warden.message
    end if warden.message.present?
  end

  def display_alert
    content_tag :div, class: 'alert' do
      flash[:alert]
    end if flash[:alert]
  end

  def display_notice
    content_tag :div, class: 'notice' do
      flash[:notice]
    end if flash[:notice]
  end

  def field_error(model, field)
    if !model.nil? && model.errors[field].any?
      content_tag :span, class: 'error' do
        model.errors[field].first
      end
    end
  end

  def localize_date(date, format)
    I18n::localize(date, format: t(format, scope: [:date, :formats]))
  end

  def localize_time(time, format)
    I18n::localize(time, format: t(format, scope: [:time, :formats]))
  end
end
