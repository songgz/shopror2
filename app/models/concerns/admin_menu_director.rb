class AdminMenuDirector
  def initialize
    @builder = HtmlBuilder.new
  end

  def build_item(item)
    @builder.tag :li,nil,{class: item.leaf? ? '' : 'has-submenu' } do
      @builder.tag :a, item.name, {:href => item.url}
      unless item.leaf?
        @builder.tag :ul, nil, {class: 'submenu menu vertical', 'data-submenu':''} do
          item.children.cache.each do |i|
            build_item(i)
          end
        end
      end
    end
  end

  def build()
    @builder.tag :ul,nil,{class:'dropdown menu top-menu', 'data-dropdown-menu': ''} do
      MenuItem.roots.cache.each do |item|
        build_item(item)
      end
    end
    self
  end

  def result
    @builder.result
  end
end