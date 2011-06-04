$ ->
  $(".remove-attach").live "click", (event) =>
    obj = $(event.target)
    p = obj.parents('li')
    p.remove()
    return false
  if ($("#attach-more").length > 0)
    $("#attach-more").bind 'click', (event) =>
      random_id = 0
      random_id += Math.floor(Math.random()*100000*num) for num in [1..10]
      e = '<div class="group"><label class="label" for="project_media_attachments_attributes_' + random_id + 
        '_media">Media</label><input id="project_media_attachments_attributes_' + random_id + 
        '_media" name="project[media_attachments_attributes][' + random_id + '][media]" type="file"></div>'
      $("#attach-list").append e
      return false
      