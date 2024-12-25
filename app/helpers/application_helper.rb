module ApplicationHelper
  
  def qrcode_tag(text, options = {})
    ::RQRCode::QRCode.new(text).as_svg(options).html_safe
  end

  def japan_date(date)
    y = date.year
    m = date.month
    d = date.day
    return "#{y} 年 #{m} 月 #{d} 日"
  end

  def date_time(date)
    y = date.year
    m = date.month
    d = date.day
    h = date.hour
    min = date.min
    return "#{y}/#{m}/#{d} #{h}:#{min}"
  end
end
