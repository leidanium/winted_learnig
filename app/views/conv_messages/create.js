alert("Refresh into the sea");

$(function() {
    $('#new_conv_message').on('ajax:success', function(a,b,c) {
        $(this).find('input["text"]').val('');
    })
})