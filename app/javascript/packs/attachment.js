$(document).on('turbolinks:load', function () {
    $(document).on("click", ".add_nested_fields, .remove_nested_fields" , function() {
        if ($('#new_product .fields:visible').length == 3)
            $('.add_nested_fields').hide()
        else
            $('.add_nested_fields').show()
    });

});
