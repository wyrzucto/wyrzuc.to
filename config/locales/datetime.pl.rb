{
  pl: {
    date: {
      month_names: lambda { |date_or_time, opts|
        if opts[:format] =~ /(%d|%-d|%e)(.*)(%B)/
          [nil, 'stycznia', 'lutego', 'marca', 'kwietnia', 'maja', 'czerwca',
          'lipca', 'sierpnia', 'września', 'października', 'listopada', 'grudnia']
        else
          [nil, 'styczeń', 'luty', 'marzec', 'kwiecień', 'maj', 'czerwiec',
          'lipiec', 'sierpień', 'wrzesień', 'październik', 'listopad', 'grudzień']
        end
      }
    }
  }
}
