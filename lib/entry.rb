require 'trimmer'

class Entry
  include Trimmer

  attr_accessor :lines

  def initialize(lines)
    @lines = lines
  end

  def paragraphs
    return [] if @lines.count == 0
    trimmed(@lines).inject([[]]) do |result, line|
      line.empty? ? result << [] : result.last << line
      result
    end
  end
end
