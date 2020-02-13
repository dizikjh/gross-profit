class PagesController < ApplicationController

  def home
    found_month()
  end

  def about
    years = ['2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020']
    
    months =['01','02','03','04','05','06','07','08','09','10','11','12']
    
    @monthly = params[:month]
    @yearly = params[:year]
    month = params[:month]
    case month# a_variable is the variable we want to compare
    when '01','03','05','07','08','10','12'    #compare to 1
      @items = Item.where("date >= ? and date <= ?", params[:year]+'-'+params[:month]+'-01', params[:year]+'-'+params[:month]+'-31' ) 
    when '04','06','09','11'    #compare to 2
      @items = Item.where("date >= ? and date <= ?", params[:year]+'-'+params[:month]+'-01', params[:year]+'-'+params[:month]+'-30' ) 
    else
      ty = params[:year].to_i   
      if ty % 4 == 0
        @items = Item.where("date >= ? and date <= ?", params[:year]+'-'+params[:month]+'-01', params[:year]+'-'+params[:month]+'-29' )
      else
        @items = Item.where("date >= ? and date <= ?", params[:year]+'-'+params[:month]+'-01', params[:year]+'-'+params[:month]+'-28' )
      end
    end
    
  end

  def contact
    years = ['2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020']
    @items  = Array.new
    j=0
    years.each do |i|
      @items[j] = Item.where("date >= ? and date <= ?", i +"-01-01", i+"-12-31" )
      j +=1
    end
  end

  def details

    months =['01','02','03','04','05','06','07','08','09','10','11','12']
    @items  = Array.new
    @year = params[:year]
    j=0
    months.each do |i|
      a_variable = i
      case a_variable # a_variable is the variable we want to compare
      when '01','03','05','07','08','10','12'    #compare to 1
        @items[j] = Item.where("date >= ? and date <= ?", params[:year]+"-"+i+"-01", params[:year]+"-"+i+"-31" )
      when '04','06','09','11'    #compare to 2
        @items[j] = Item.where("date >= ? and date <= ?", params[:year]+"-"+i+"-01", params[:year]+"-"+i+"-30" )
      else
        ty = params[:year].to_i   
        if ty % 4 == 0
          @items[j] = Item.where("date >= ? and date <= ?", params[:year]+"-"+i+"-01", params[:year]+"-"+i+"-29" )
        else
          @items[j] = Item.where("date >= ? and date <= ?", params[:year]+"-"+i+"-01", params[:year]+"-"+i+"-28" )
        end  
      end
      j +=1
    end
  end

  def found_month

    years = ['2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020']
    
    months =['01','02','03','04','05','06','07','08','09','10','11','12']
    @items  = Array.new(years.length){Array.new(months.length)}
    j=0
    years.each do |i|
      l=0
      months.each do |k|
        a_variable = k
        case a_variable # a_variable is the variable we want to compare
        when '01','03','05','07','08','10','12'    #compare to 1
          @items[j][l] = Item.where("date >= ? and date <= ?", i +"-"+k+"-01", i +"-"+k+"-31" )
        when '04','06','09','11'    #compare to 2
          @items[j][l] = Item.where("date >= ? and date <= ?", i +"-"+k+"-01", i +"-"+k+"-30" )
        else
          ty = i.to_i   
          if ty % 4 == 0
            @items[j][l] = Item.where("date >= ? and date <= ?", i +"-"+k+"-01", i +"-"+k+"-29" )
          else
            @items[j][l] = Item.where("date >= ? and date <= ?", i +"-"+k+"-01", i +"-"+k+"-28" )
          end
        end
        l+=1
      end
      j +=1
    end  
  end 
end
