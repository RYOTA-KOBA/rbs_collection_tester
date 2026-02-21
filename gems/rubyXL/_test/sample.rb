# rbs_inline: enabled

require "rubyXL"
require "rubyXL/convenience_methods"

class WorkbookSample
  #: () -> RubyXL::Workbook
  def create_workbook
    RubyXL::Workbook.new
  end

  #: (RubyXL::Workbook, String) -> RubyXL::Worksheet
  def add_sheet(workbook, name)
    workbook.add_worksheet(name)
  end

  #: (RubyXL::Worksheet, Integer, Integer, String) -> RubyXL::Cell
  def write_cell(worksheet, row, col, value)
    worksheet.add_cell(row, col, value)
  end

  #: (RubyXL::Worksheet, Integer, Integer) -> RubyXL::Cell?
  def read_cell(worksheet, row, col)
    worksheet[row]&.[](col)
  end
end

sample = WorkbookSample.new
workbook = sample.create_workbook
worksheet = workbook[0]
if worksheet
  sample.write_cell(worksheet, 0, 0, "Hello")
  sample.write_cell(worksheet, 0, 1, "World")
  cell = sample.read_cell(worksheet, 0, 0)
  puts cell&.value
end
