$(document).ready(function() {
    $("#dormname, #studentname").on("input", function() {
        var errorsId = $(this).attr("id") + "Errors";
        $("#" + errorsId).html(""); // Clear the error messages
    });
});