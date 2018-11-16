class AdminCategoryDirector
  def initialize
    @builder = HtmlBuilder.new
  end

  def build_item(item)
    @builder.tag :li do
      @builder.tag :a, item.name, {:href => "/admin/categories/#{item.id}"}
      unless item.leaf?
        @builder.tag :ul, nil, class: 'nested vertical menu' do
          item.children.cache.each do |i|
            build_item(i)
          end
        end
      end
    end
  end

  def build()
    @builder.tag :ul, nil, class: 'vertical menu' do
      Category.roots.cache.each do |item|
        build_item(item)
      end
    end
    self
  end

  def result
    @builder.result
  end
end
