module ApplicationHelper
  def page_image
    if @page
      if @page.parent
        @page.parent.slug
      else
        @page.slug
      end
    elsif params[:type]
      params[:type].parameterize
    else
      'top-foto'
    end
  end
end
