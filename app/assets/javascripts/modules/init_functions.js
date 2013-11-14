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

}

YellowRed.instantiateProfileCollections = function() {
  YellowRed.messages             = new YellowRed.Collections.AllMessages();
	YellowRed.all_profiles         = new YellowRed.Collections.AllProfiles();
  YellowRed.searched_profiles    = new YellowRed.Collections.SearchedProfiles();
	YellowRed.maybe_profiles       = new YellowRed.Collections.MaybeProfiles();
	YellowRed.nope_profiles        = new YellowRed.Collections.NopeProfiles();
	YellowRed.starred_profiles     = new YellowRed.Collections.StarredProfiles();
	YellowRed.starring_profiles    = new YellowRed.Collections.StarringProfiles();
}
