window.YellowRed = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		console.log("initialized")
		YellowRed.searched_profiles = new YellowRed.Collections.SearchedProfiles();
		YellowRed.searched_profiles.fetch({
			success: function () {
				new YellowRed.Routers.App({
					central_content: $("#central-content"),
				});
				Backbone.history.start();

				var searchResults = new YellowRed.Views.ProfilesList({
					collection: YellowRed.searched_profiles
				});
				$("#search-results").html(searchResults.render().$el)
			}
		});
  }
};

$(document).ready(function(){
  YellowRed.initialize();
});
