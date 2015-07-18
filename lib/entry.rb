require_relative "trimmer"

class Entry
  include Trimmer

  attr_accessor :lines

  def initialize(lines)
    @lines = lines
  end

  def paragraphs
    return [] if @lines.count == 0
    trimmed(@lines).inject([[]]) do |result, line|
      add_line_to_paragraphs(result, line)
    end
  end

  def add_line_to_paragraphs(result, line)
    return (result << []) if line.empty?
    return (result << [line]) if indent_changed?(line, result)
    result.last << line
    result
  end

  def indent_changed?(line, result)
    return false if result.last.empty?
    line.indent > 0 && (line.indent != result.last.last.indent)
  end
end
