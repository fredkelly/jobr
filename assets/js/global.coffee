jQuery ->
  $('#results li').click ->
    window.location = $('a', this).attr('href')
    
  $('#search button').click (e) ->
    if $('#search input:first').val() == '' and $('#search input:last').val() == ''
      alert 'Please complete at least one field.'
      e.preventDefault()