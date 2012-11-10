jQuery ->
  $('#results li').click ->
    window.location = $('a', this).attr('href')