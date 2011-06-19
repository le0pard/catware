class ProjectsObject
  constructor: ->
    this.init_screens()
    this.init_videos()
  init_screens: ->
    $('ul.screens a').live 'click', (event) => 
      object = $(event.target)
      url = object.parent('a').attr('href')
      if (url?)
        $('.big_android img').animate {opacity: 0}, 'slow', (event) => 
          $('.big_android img').attr('src', url).animate({opacity: 1})
      return false
  init_videos: ->
    $("div.video_block a").fancybox();
    
$ ->
  projects_object = new ProjectsObject