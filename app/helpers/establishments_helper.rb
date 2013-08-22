module EstablishmentsHelper
  def display_establishments
    if Establishment.all.empty?
      content_tag :h3, class: 'gray-label empty-message' do
        t('.empty-list-establishments')
      end
    else
      render partial: "shared/establishment", collection: Establishment.all, as: :establishment
    end
  end
end