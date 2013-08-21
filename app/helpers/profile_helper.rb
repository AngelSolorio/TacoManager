module ProfileHelper
  def display_avatar(user)
    if !user.picture_file_name.nil?
      image_tag user.picture.url(:thumb), id: 'photo', width: '112px', height: '112px'
    elsif !user.email.gsub('spam', user.name).nil?
      if user.image_url.nil?
        default_image = 'https://www.evernote.com/shard/s30/sh/21b1ac67-8b1b-4bc8-adde-291c8825c82c/6e6cd1a2250ff2888f9c237c6bb255ac/deep/0/person.png'
      else
        default_image = user.image_url
      end
      gravatar_image_tag(user.email.gsub('spam', user.name), alt: user.name, id: 'avatar', gravatar: { default: default_image })
    end
  end

  def display_user_orders(user)
    if user.orders.empty?
      content_tag :h3, class: 'gray-label empty-message' do
        t('.empty-list-user-orders')
      end
    else
      render partial: "shared/table_orders", locals: {user: user}
    end
  end

  def display_user_establishments(user)
    if user.establishments.empty?
      content_tag :h3, class: 'gray-label empty-message' do
        t('.empty-list-user-establishments')
      end
    else
      render partial: "shared/table_establishments", locals: {user: user}
    end
  end
end
