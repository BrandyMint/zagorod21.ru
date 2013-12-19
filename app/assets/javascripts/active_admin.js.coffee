#= require active_admin/base
#= require jquery-fileupload/basic

$ ->
  $('#new_image').fileupload
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        $('span#progress').html('Загрузка ', progress + '%')
    success: ->
      alert 'Фотография загружена.'
    error: ->
      alert 'При загрузке фотографий вознкли ошибки, обновите страницу и попробуйте еще раз.'