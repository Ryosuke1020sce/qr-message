module ApplicationHelper
  
  def qrcode_tag(text, options = {})
    ::RQRCode::QRCode.new(text).as_svg(options).html_safe
  end

  def japan_date(date)
    date = date.to_datetime + (9.0/24)
    y = date.year
    m = date.month
    d = date.day
    return "#{y} 年 #{m} 月 #{d} 日"
  end

  def date_time(date)
    date = date.to_datetime + (9.0/24)
    y = date.year 
    m = date.month
    d = date.day
    h = date.hour
    min = date.min
    if min == 0
      min = "00"
    elsif min < 10
      min = "0#{min}"
    end
    return "#{y}/#{m}/#{d} #{h}:#{min}"
  end
end
