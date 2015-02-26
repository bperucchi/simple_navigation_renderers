module SimpleNavigationRenderers
  class BootstrapBreadcrumbs < SimpleNavigation::Renderer::Base
    def render(item_container)

      content_tag :ul, li_tags(item_container).join(join_with), {
        id: item_container.dom_id,
        class: "#{item_container.dom_class} breadcrumb"
      }
    end

    protected

    def li_tags(item_container)
      item_container.items.each_with_object([]) do |item, list|
        next unless item.selected?
        if include_sub_navigation?(item)
          options = { method: item.method }.merge(item.html_options.except(:class, :id))
          list << unless item.url
                    content_tag(:li, item.name[:text])
                  else  
                    content_tag(:li, link_to(item.name[:text], item.url), options)
                  end
          list.concat li_tags(item.sub_navigation)
        else
          list << content_tag(:li, item.name[:text], { class: 'active' })
        end
      end
    end

    def join_with
      @join_with ||= options[:join_with] ? ("<span class='divider'>"+ options[:join_with] +"</span>").html_safe : ''
    end
  end
end