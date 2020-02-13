#  Match the name (items_import)
class ItemsImport
  include ActiveModel::Model
  require 'roo'

# give us access to params[:items_import][:file] throughout the object.
  attr_accessor :file

# when call @items_import = ItemsImport.new, seting method attribute avaialbe empty during the create action 
# attribute is send back to the ItemsImport object

def initialize(attributes={})
  attributes.each { |name, value| send("#{name}=", value) }
  # yield self
end


  def persisted?
    false
  end

  def open_spreadsheet
    #:file attribute, open a spreadsheet using Roo
    # use a case statement to that takes in the file extension, and selects an appropriate action for opening the spreadsheet

    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

 #include the id attribute for each item.use ActiveModel’s find_by_id method to look up the existing Item in our database, and update it as required
  def load_imported_items
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1) # start 1st cell
    (2..spreadsheet.last_row).map do |i| #maping from 2
      #the transpose method to convert this into an array with two columns and a number of rows equal to the number of items in both header and spreadsheet.row(i)
      puts i
      row = Hash[[header, spreadsheet.row(i)].transpose] #Hash
      item = Item.find_by_id(row["id"]) || Item.new
      item.attributes = row.to_hash
      item
    end
  end

  def imported_items
    @imported_items ||= load_imported_items
  end

  def save
    if imported_items.map(&:valid?).all?
      imported_items.each(&:save!)
      true
    else
      imported_items.each_with_index do |item, index|
        item.errors.full_messages.each do |msg|
          errors.add :base, "Row #{index + 6}: #{msg}"
        end
      end
      false
    end
  end

end