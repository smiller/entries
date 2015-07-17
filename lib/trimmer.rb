module Trimmer
  def trimmed(lines)
    lines = trim_empty_start_and_finish(lines)
    trim_empty_duplicate_middle(lines)
  end

  def trim_empty_start_and_finish(lines)
    start = first_non_empty(lines)
    finish = first_non_empty(lines.reverse)
    lines[start..-(finish + 1)]
  end

  def first_non_empty(lines)
    lines.each_with_index do |l, index|
      return index unless l.empty?
    end
  end

  def trim_empty_duplicate_middle(lines)
    lines.inject([]) do |result, line|
      result << line unless (line.empty? && result.last.empty?)
      result
    end
  end
end
