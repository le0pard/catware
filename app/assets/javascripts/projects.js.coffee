class ProjectsObject
  constructor: ->
    this.init_screens()
  init_screens: ->
    $('ul.screens a').live 'click', (event) => 
      object = $(event.target)
      url = object.parent('a').attr('href')
      if (!url.nil?)
        if (!$('#main_screen').hasClass('screens_background'))
          $('#main_screen').addClass('screens_background')
        $('#main_screen').html('<div class="screen_img"><img src="' + url + '" alt ="img" /></div>')
      return false
      
    
$ ->
  projects_object = new ProjectsObject