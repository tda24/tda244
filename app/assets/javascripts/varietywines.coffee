save_form = ->
  $('.select_form select').each ->
    if ($(this).val() == '*Создание нового')
      $(this).next().remove()
      $(this).remove()
    else if ($(this).val() == '*Редактирование')
      $(this).remove()
    else
      $(this).next().remove()

ready = ->
  $('#save').on 'click', save_form


$(document).ready ready
$(document).on 'page:load', ready
