class Entry
  attr_accessor :lines

  def initialize(lines)
    @lines = lines
  end

  def paragraphs
    @lines.count == 0 ? [] : build_paragraphs
  end

  def build_paragraphs
    [[@lines.first]].tap do |paras|
      @lines[1..-1].each do |line|
        paras = add_line(paras, line)
      end
    end
  end

  def add_line(paras, line)
    paras.tap do |p|
      line.text == "" ? p << [] : p.last << line
    end
  end
end
