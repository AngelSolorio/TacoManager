module EstablishmentsHelper
  def display_establishments(establishments)
    if establishments.empty?
      content_tag :h3, class: 'gray-label empty-message' do
        t('.empty-list-establishments')
      end
    else
      render partial: "shared/establishment", collection: establishments, as: :establishment
    end
  end

  def render_stars(rating)
    StarsRenderer.new(rating, self).render_stars
  end
end
