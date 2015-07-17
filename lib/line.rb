class Line
  attr_accessor :indent, :text

  def initialize(indent = 0, text)
    @indent = indent
    @text = text
  end

  def empty?
    text == ""
  end
end
