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

  # @rbs path: String
  # @rbs return: RubyXL::Workbook
  def self.open(path) #: RubyXL::Workbook
    RubyXL::Parser.parse(path)
  end

  # @rbs sheet_name: String
  # @rbs return: RubyXL::Worksheet
  def add_sheet(sheet_name) #: RubyXL::Worksheet
    @workbook.add_worksheet(sheet_name)
  end

  # @rbs index: Integer
  # @rbs return: RubyXL::Worksheet?
  def sheet(index) #: RubyXL::Worksheet?
    @workbook[index]
  end

  # @rbs worksheet: RubyXL::Worksheet
  # @rbs row: Integer
  # @rbs col: Integer
  # @rbs value: String | Integer | Float | nil
  # @rbs return: RubyXL::Cell
  def write_cell(worksheet, row, col, value) #: RubyXL::Cell
    worksheet.add_cell(row, col, value)
  end

  # @rbs worksheet: RubyXL::Worksheet
  # @rbs row: Integer
  # @rbs col: Integer
  # @rbs return: RubyXL::Cell?
  def read_cell(worksheet, row, col) #: RubyXL::Cell?
    worksheet[row]&.[](col)
  end

  # @rbs path: String
  # @rbs return: void
  def save(path) #: void
    @workbook.write(path)
  end
end
