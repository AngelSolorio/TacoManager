module ProfileHelper
  def display_user_establishments(user)
    content_tag :div, class: 'list-user-establishments' do
      if user.establishments.empty?
         content_tag :h3, class: 'gray-label empty-message' do
          t('.empty-list-user-establishments')
         end
      else
        user.establishments.each do |establishment|
          establishment.name
          establishment.address
        end
      end
    end
  end

  def display_user_orders(user)
    content_tag :div, class: 'list-user-orders' do
      if user.orders.empty?
         content_tag :h3, class: 'gray-label empty-message' do
          t('.empty-list-user-orders')
         end
      else
        user.orders.each do |order|
          order.created_at
          order.cost
          order.requisition[:estimate]
          order.requisition[:status]
        end
      end
    end
  end
end