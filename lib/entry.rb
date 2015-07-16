class Entry
  attr_accessor :lines

  def initialize(lines)
    @lines = lines
  end

  def paragraphs
    return [] if @lines.count == 0
    lines_trimmed.inject([[]]) do |result, line|
      build_next_result(result, line)
    end
  end

  private

  def lines_trimmed
    start = first_non_blank_index(@lines)
    finish = first_non_blank_index(@lines.reverse)
    @lines[start..-(finish + 1)]
  end

  def first_non_blank_index(lines)
    lines.each_with_index do |l, index|
      return index if l.text != ""
    end
  end

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
