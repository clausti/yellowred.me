YellowRed.staticElementEventHandlers = function() {
	$("#current-user-thumbnail-utility").on("click", function() {
		YellowRed.appRouter.navigate("profile", { trigger: true} )
	});
  
	$("#search-form").on("submit", function(event) {
    event.preventDefault();
    var searchFormData = $(event.currentTarget).serializeJSON();
    $.ajax({
      url: "saved_search",
      type: "put",
      data: searchFormData,
      success: function() {
        YellowRed.appRouter.populateSearchResults();
      }
    });
	});
  
  $("#demo-user").on("click", function(event) {
    event.preventDefault();
    $("#user_email").attr("value", "gary@thegreywolf.com");
    $("#user_password").attr("value", "password");
    $("#demo-user").attr("value", "Log In Gary");
    $("#demo-user").off();
  });
  
  $("#user_username").on("blur", function(event) {
    var that = this;
    var username = $(event.currentTarget).val();
    $.ajax({
      url: "check-username/" + username,
      success: function(res) {
        console.log("here")
        $("#errors-marquee").html("Username not available");
      },
      error: function() {
        console.log("there")
        $("#errors-marquee").html('');
      }
    });
  });

}