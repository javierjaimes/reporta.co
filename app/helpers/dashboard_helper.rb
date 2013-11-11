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
      'aproximadamente 1 hora'
    when 91..150
      'aproximadamente 2 hora'
    when 151..210
      'aproximadamente 3 hora'
    when 211..270
      'aproximadamente 4 horas'
    else
      'mas de 5 horas'
    end

  end
end
