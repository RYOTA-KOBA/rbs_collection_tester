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

# RubyXL::Workbook
workbook = RubyXL::Workbook.new

# worksheets
worksheets = workbook.worksheets

# add_worksheet (with name)
ws1 = workbook.add_worksheet("Sheet1")

# add_worksheet (without name)
ws2 = workbook.add_worksheet

# [] with Integer
ws_by_index = workbook[0]

# [] with String
ws_by_name = workbook["Sheet1"]

# stream -> StringIO
io = workbook.stream
_binary = io.read

# RubyXL::Worksheet
# sheet_name
name = ws1.sheet_name

# sheet_name=
ws1.sheet_name = "Renamed"

# sheet_data -> SheetData
sheet_data = ws1.sheet_data

# SheetData#rows
rows = sheet_data.rows

# SheetData#size
sheet_data_size = sheet_data.size

# SheetData#[]
row = sheet_data[0]

# add_cell
cell = ws1.add_cell(0, 0, "Hello")

# add_cell with formula
ws1.add_cell(1, 0, nil, "SUM(A1:A1)")

# change_row_height
ws1.change_row_height(0, 20)

# change_row_font_size
ws1.change_row_font_size(0, 12)

# change_column_width
ws1.change_column_width(0, 15)

# Row
if row
  cells = row.cells
  row_size = row.size
  cell_from_row = row[0]
end

# Cell
cell2 = ws1.add_cell(0, 1, "World")

# value
val = cell2.value

# change_fill
cell2.change_fill("FF0000")

# change_font_bold
cell2.change_font_bold(true)

# change_text_wrap
cell2.change_text_wrap(true)

# change_vertical_alignment
cell2.change_vertical_alignment("center")

# RubyXL::Parser
parsed_wb = RubyXL::Parser.parse("/dev/null") rescue nil

# parse_buffer
parsed_from_buffer = RubyXL::Parser.parse_buffer("") rescue nil
