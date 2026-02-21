# frozen_string_literal: true

# rbs_inline: enabled

require "rubyXL"
require "rubyXL/convenience_methods"

# A class for managing Excel workbooks using rubyXL.
class WorkbookManager
  attr_reader :workbook #: RubyXL::Workbook

  def initialize #: void
    @workbook = RubyXL::Workbook.new
  end

  #: (String path) -> RubyXL::Workbook
  def self.open(path)
    RubyXL::Parser.parse(path)
  end

  #: (String sheet_name) -> RubyXL::Worksheet
  def add_sheet(sheet_name)
    @workbook.add_worksheet(sheet_name)
  end

  #: (Integer index) -> RubyXL::Worksheet?
  def sheet(index)
    @workbook[index]
  end

  #: (RubyXL::Worksheet worksheet, Integer row, Integer col, String | Integer | Float | nil value) -> RubyXL::Cell
  def write_cell(worksheet, row, col, value)
    worksheet.add_cell(row, col, value)
  end

  #: (RubyXL::Worksheet worksheet, Integer row, Integer col) -> RubyXL::Cell?
  def read_cell(worksheet, row, col)
    worksheet[row]&.[](col)
  end

  #: (String path) -> void
  def save(path)
    @workbook.write(path)
  end
end
