module DashboardHelper
  def time_elapsed time
    seconds = (Time.now - time) / 60
    debug( seconds.to_i )
    case seconds.to_i 
    when 0..9
      'unos minutos'
    when 10..45
      [seconds.to_i, 'minutos'].join ' '
    when 46..90
      'Mas de 1h'
    when 91..150
      'Mas de 2h'
    when 151..210
      'Mas de 3h'
    when 211..270
      'Mas de 4h'
    else
      'Mas de 5h'
    end

  end

  def is_active key
    if key == 0
      'active'
    else
      ''
    end
  end
end
