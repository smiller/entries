require_relative "../lib/entry"
require_relative "../lib/line"

RSpec.describe Entry, "#paragraphs" do
  context "empty" do
    it "returns []" do
      entry = Entry.new([])
      expect(entry.paragraphs).to eq([])
    end
  end
  context "one line" do
    it "returns [[one_line]]" do
      one_line = Line.new("one_line")
      entry = Entry.new([one_line])
      expect(entry.paragraphs).to eq([[one_line]])
    end
  end
  context "three paras" do
    it "returns three paras" do
      first = [Line.new("first")]
      middle = [Line.new("middle 1"), Line.new("middle 2")]
      last = [Line.new("last")]
      blank = Line.new("")
      entry = Entry.new([first, blank, middle, blank, last].flatten)
      expect(entry.paragraphs).to eq([first, middle, last])
    end
  end
  context "two paras with two blank lines" do
    it "returns two paras" do
      first = [Line.new("mind the gap...")]
      blank = Line.new("")
      second = [Line.new("... safely stowed")]
      entry = Entry.new([first, blank, blank, second].flatten)
      expect(entry.paragraphs).to eq([first, second])
    end
  end

  context "blanks at beginning" do
    context "two" do
      it "returns one para" do
        blank = Line.new("")
        second = [Line.new("... safely stowed")]
        entry = Entry.new([blank, blank, second].flatten)
        expect(entry.paragraphs).to eq([second])
      end
    end
    context "one" do
      it "returns one para" do
        blank = Line.new("")
        second = [Line.new("... safely stowed")]
        entry = Entry.new([blank, second].flatten)
        expect(entry.paragraphs).to eq([second])
      end
    end
  end
  context "blanks at end" do
    context "one" do
      it "returns one para" do
        first = [Line.new("mind the gap...")]
        blank = Line.new("")
        entry = Entry.new([first, blank].flatten)
        expect(entry.paragraphs).to eq([first])
      end
    end
    context "two" do
      it "returns one para" do
        first = [Line.new("mind the gap...")]
        blank = Line.new("")
        entry = Entry.new([first, blank, blank].flatten)
        expect(entry.paragraphs).to eq([first])
      end
    end
  end

  context "changing indent changes paragraph" do
    it "returns two paras" do
      first = [Line.new(1, "LENNOX")]
      second = [Line.new(2, "Sent he to Macduff?")]
      entry = Entry.new([first, second].flatten)
      expect(entry.paragraphs).to eq([first, second])
    end
  end
end
