$(document).ready(function() {
  var fetchRole = "a[data-role='fetch']";

  $(document).on("ajax:success", fetchRole, function (_e, _data, _status, xhr) {
    console.log("Fetching feed");
    $("div#flash").replaceWith(xhr.responseText);
  })
  .on("ajax:error", fetchRole, function(_e, _xhr, _status, _error) {
    console.log("Error");
  })
  .on("ajax:complete", fetchRole, function(_e, _xhr, _status) {
    console.log("Fetch complete");
  });
});
