#= require active_admin/base
#= require jquery-fileupload/basic
#= require tinymce

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

  tinymce.init
    menubar : false
    selector: "textarea"
    theme: "modern"
    toolbar: "undo redo | bold italic | styleselect | fontselect | fontsizeselect | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
    plugins: ['contextmenu','image', 'code', 'link', 'preview', 'table']
    convert_urls: false
