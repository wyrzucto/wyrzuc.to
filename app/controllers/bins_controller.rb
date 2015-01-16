require 'roo'
class BinsController < ApplicationController
  before_action :set_bin, only: [:show, :edit, :update, :destroy]

  # GET /bins
  # GET /bins.json
  def index
    @bins = Bin.all
    spreadsheet = Roo::Excelx.new("./public/s5.xlsx")
header = spreadsheet.row(1)
(2..spreadsheet.last_row).each do |i|
a = spreadsheet.cell(i,1)
b = spreadsheet.cell(i,2)
c = spreadsheet.cell(i,3)
d = spreadsheet.cell(i,4).to_s
e = spreadsheet.cell(i,5)
case d
when "1.0" then Bin.create(ul: a,ulica: b,suche: 'poniedzialek',mokre: 'poniedzialek',dzielnica: e)
when "2.0" then Bin.create(ul: a,ulica: b,suche: 'wtorek',mokre: 'wtorek',dzielnica: e)
when "3.0" then Bin.create(ul: a,ulica: b,suche: 'środa',mokre: 'sroda',dzielnica: e)
when "4.0" then Bin.create(ul: a,ulica: b,suche: 'czwartek',mokre: 'czwartek',dzielnica: e)
when "5.0" then Bin.create(ul: a,ulica: b,suche: 'piatek',mokre: 'piatek',dzielnica: e)
when "6.0" then Bin.create(ul: a,ulica: b,suche: 'sobota',mokre: 'sobota',dzielnica: e)
end
  end
 spreadsheet = Roo::Excelx.new("./public/h1.xlsx")
header = spreadsheet.row(1)
(2..spreadsheet.last_row).each do |i|
Select.create(ulica: spreadsheet.cell(i,3))
end
@sel = Select.near(Bin.where(:ulica => params[:ulica]))
@ul = Bin.where(:ulica => params[:ulica])
@hash = Gmaps4rails.build_markers(@ul) do |user, marker|
  marker.lat user.latitude
  marker.lng user.longitude
end
end
  # GET /bins/1
  # GET /bins/1.json
  
  def show
  end

  # GET /bins/new
  def new
    @bin = Bin.new
  end

  # GET /bins/1/edit
  def edit
  end

  # POST /bins
  # POST /bins.json
  def create
    @bin = Bin.new(bin_params)

    respond_to do |format|
      if @bin.save
        format.html { redirect_to @bin, notice: 'Bin was successfully created.' }
        format.json { render :show, status: :created, location: @bin }
      else
        format.html { render :new }
        format.json { render json: @bin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bins/1
  # PATCH/PUT /bins/1.json
  def update
    respond_to do |format|
      if @bin.update(bin_params)
        format.html { redirect_to @bin, notice: 'Bin was successfully updated.' }
        format.json { render :show, status: :ok, location: @bin }
      else
        format.html { render :edit }
        format.json { render json: @bin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bins/1
  # DELETE /bins/1.json
  def destroy
    @bin.destroy
    respond_to do |format|
      format.html { redirect_to bins_url, notice: 'Bin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bin
      @bin = Bin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bin_params
      params.require(:bin).permit(:ul, :ulica, :dzielnica, :numer, :suche, :mokre, :zmieszane, :latitude, :longitude)
    end
end
