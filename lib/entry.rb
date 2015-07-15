class Entry
  attr_accessor :lines

  def initialize(lines)
    @lines = lines
  end

  def paragraphs
    return [] if @lines.count == 0
    @lines.inject([[]]) do |result, line|
      build_next_result(result, line)
    end
  end

  private

  def build_next_result(result, line)
    unless second_blank_line(result, line)
      line.text == "" ? result << [] : result.last << line
    end
    result
  end

  def second_blank_line(result, line)
    line.text == "" && result.last == []
  end
end
