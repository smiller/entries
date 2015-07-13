class Entry
  attr_accessor :lines

  def initialize(lines)
    @lines = lines
  end

  def paragraphs
    return [] if @lines.count == 0
    @lines.inject([[]]) do |result, line|
      line.text == "" ? result << [] : result.last << line
      result
    end
  end
end
