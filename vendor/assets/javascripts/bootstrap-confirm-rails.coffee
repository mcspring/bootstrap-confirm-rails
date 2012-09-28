jQuery ->

  $ = jQuery

  # Override Rails handling of confirmation
  # This will overwrite rails delete confirmation dialog to use bootstrap model
  $.rails.allowAction = (element) ->
    # The message title is something like "Are you sure?"
    message_title = element.data('confirm')
    # If there's no message_title, there's no data-confirm attribute, which means there's nothing to confirm
    return true unless message_title
    # This will allow user define there own options
    message_body = element.data('confirm-body') || ''
    button_ok = element.data('confirm-ok') || "Yes, I'm positively certain."
    button_cancel = element.data('confirm-cancel') || 'Cancel'

    # Clone the clicked element (probably a delete form or link/button) so we can use it in the dialog box.
    $element = element.clone()
      # We don't necessarily want the same styling as the original form/link/button.
      .removeAttr('class')
      # We don't want to pop up another confirmation (recursion)
      .removeAttr('data-confirm')
    # We should check whether this is a confirmation form or link/button?
    if $element.is('form')
      $button = $element.find('button')
      if $button
        $button.text(button_ok)
    else
      # We want a button styling for normal link/button
      $element.addClass('btn btn-danger')
        # We want it to sound confirmy
        .html(button_ok)

    # Create the modal box with the message
    button_close = ''
    if message_body
      button_close = """<a class="close" data-dismiss="modal">×</a>"""
      message_body = """<div class="modal-body"><p>#{message_body}</p></div>"""

    $modal = $("""
                 <div id="rails_confirm_dialog" class="modal fade">
                   <div class="modal-header">
                     #{button_close}
                     <h3>#{message_title}</h3>
                   </div>
                   #{message_body}
                   <div class="modal-footer">
                     <a data-dismiss="modal" class="btn">#{button_cancel}</a>
                   </div>
                 </div>
               """)
    $modal.addClass('modal-mini') unless message_body
    # Add the new button to the modal box
    $modal.find('.modal-footer').append($element)
    # Pop it up
    $modal.modal()
    # Destroy it after hide
    $modal.on 'hidden', (evt)->
      $modal.remove()
    # Prevent the original link from working
    return false
