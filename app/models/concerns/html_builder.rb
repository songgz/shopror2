class HtmlBuilder
  def initialize
    @data = []
  end

  def tag(name, text = nil, option = {})
    @data << "<#{name}"
    option.each {|k, v| @data << " #{k}='#{v}'" }
    @data << ">"
    @data << text if text
    yield if block_given?
    @data << "</#{name}>"
  end

  def result
    @data.join("")
  end
end
