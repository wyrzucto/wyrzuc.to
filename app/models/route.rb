class Route < ActiveRecord::Base
  has_many :containers, -> { order(position: :asc) }, dependent: :nullify, class: Wastes::PackagingWaste
  has_many :route_versions, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true

  def to_s
    self.name
  end

  def has_new_version?
    self.route_versions.none? || self.route_versions.last.container_ids != self.containers.map(&:id)
  end


  def export_sheet
    bold = Spreadsheet::Format.new weight: :bold, vertical_align: :middle
    center = Spreadsheet::Format.new horizontal_align: :centre, vertical_align: :middle
    center_bold = Spreadsheet::Format.new horizontal_align: :centre, vertical_align: :centre, weight: :bold, vertical_align: :middle
    border = Spreadsheet::Format.new border: :thin, vertical_align: :middle
    
    route_book = Spreadsheet::Workbook.new
    route_sheet = route_book.create_worksheet name: self.name

    route_sheet.default_format = Spreadsheet::Format.new(vertical_align: :middle)
    route_sheet.pagesetup[:orientation] = :landscape

    route_sheet.column(0).width = 5
    route_sheet.column(1).width = 35
    (2..5).each { |inx| route_sheet.column(inx).width = 10 }
    route_sheet.column(6).width = 15
    route_sheet.column(7).width = 35


    8.times { |inx| route_sheet.row(0).update_format(inx, weight: :bold) }
    
    route_sheet[0, 0] = self.name
    route_sheet[0, 2] = 'Numer rejestracyjny pojazdu'
    route_sheet[0, 7] = 'Data'

    route_sheet.row(0).height = 20
    route_sheet.merge_cells(0, 2, 0, 6)
    route_sheet.merge_cells(0, 0, 0, 1)

    route_sheet.row(1).height = 12
    route_sheet.merge_cells(1, 2, 1, 6)
    route_sheet.merge_cells(1, 0, 1, 1)


    route_sheet[2, 0] = "Lp."
    route_sheet[2, 1] = "Lokalizacja"
    route_sheet[2, 2] = "Rodzaj asortymentu"
    route_sheet[2, 6] = "Typ pojemnika"
    route_sheet[2, 7] = "Uwagi"
    route_sheet.merge_cells(2, 2, 2, 5)
    8.times { |inx| route_sheet.row(2).update_format(inx, weight: :bold, horizontal_align: :centre) }


    route_sheet[3, 2] = "SzB."
    route_sheet[3, 3] = "SzK."
    route_sheet[3, 4] = "Tw."
    route_sheet[3, 5] = "Mak."

    (2..5).each { |inx| route_sheet.row(3).update_format(inx, weight: :bold, horizontal_align: :centre)  }
    route_sheet.merge_cells(2, 0, 3, 0)
    route_sheet.merge_cells(2, 1, 3, 1)
    route_sheet.merge_cells(2, 6, 3, 6)
    route_sheet.merge_cells(2, 7, 3, 7)

    route_sheet.row(2).height = 16
    route_sheet.row(3).height = 16

    cont_inx = 1
    row_inx = 4
    self.containers.each do |container|
      route_sheet[row_inx, 0] = cont_inx
      route_sheet[row_inx, 1] = container.street
      route_sheet[row_inx, 2] = container.clear_glass_containers
      route_sheet[row_inx, 3] = container.colorful_glass_containers
      route_sheet[row_inx, 4] = container.plastic_containers
      route_sheet[row_inx, 5] = container.maculature_containers
      route_sheet[row_inx, 6] = container.container_type
      route_sheet[row_inx, 7] = container.details

      route_sheet.row(row_inx).update_format(0, horizontal_align: :centre)
      route_sheet.row(row_inx).update_format(6, horizontal_align: :centre)
      route_sheet.row(row_inx).height = 18
      cont_inx += 1
      row_inx += 1
    end

    route_sheet[row_inx, 1] = 'Legenda:'
    route_sheet[row_inx, 2] = 'P - połowa, F - full, C - ćwiartka'
    route_sheet.merge_cells(row_inx, 2, row_inx, 7)
    8.times { |inx| route_sheet.row(row_inx).update_format(inx, weight: :bold, horizontal_align: :centre) }
    route_sheet.row(row_inx).height = 20
    row_inx += 1

    0.upto(row_inx).each do |row_inx| 
      (0..7).each do |col_inx|
        route_sheet.row(row_inx).update_format(col_inx, border: :thin)
      end
    end
    route_book
  end
end
