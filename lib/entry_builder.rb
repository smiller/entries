class EntryBuilder
  def initialize(raw_lines)
    @raw_lines = raw_lines
  end

  def build
    Entry.new(build_lines)
  end

  def build_lines
    [new_line(@raw_lines[0])].tap do |lines|
      @raw_lines[1..-1].each do |raw_line|
        lines << new_line(raw_line, lines.last.indent)
      end
    end
  end

  def new_line(raw_line, last_indent = 0)
    c = raw_line.split("> ")
    return Line.new("") if c.size == 0
    Line.new(new_indent(c.length - 1, last_indent), c.last)
  end

  def new_indent(current, previous)
    current == 0 ? previous : current
  end
end
