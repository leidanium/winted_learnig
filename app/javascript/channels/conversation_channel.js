//= require action_cable
//= require_self
//= require_tree ./channels

$(function() {
    alert("TURURUUUUUUU");

    $('[data-channel-subscribe="conversation"]').each(function(index, element) {
      var $element = $(element),
          conversation_id = $element.data('conversation-id')
          messageTemplate = $('[data-role="message-template"]');
  
      $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)        
  
      App.cable.subscriptions.create(
        {
          channel: "ConversationChannel",
          conversation: conversation_id
        },
        {
          received: function(data) {
            var content = messageTemplate.children().clone(true, true);
            content.find('[data-role="message-text"]').text(data.message);
            content.find('[data-role="message-date"]').text(data.updated_at);
            $element.append(content);
            $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
          }
        }
      );
    });
  });
  

  current_user