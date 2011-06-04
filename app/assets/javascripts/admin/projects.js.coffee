$ ->
  $(".remove-attach").live "click", (event) =>
    obj = $(event.target)
    p = obj.parents('li')
    p.remove()
    return false
  if ($("#attach-more").length > 0)
    $("#attach-more").bind 'click', (event) =>
      e = "<li><input type='file' name='attachments[]' /> <a href='#' class='remove-attach'>Delete</a></li>"
      $("#attach-list").append e
      return false
      