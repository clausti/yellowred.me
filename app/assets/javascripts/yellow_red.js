window.YellowRed = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		// collection of posts that match the search results to display on home pg
		// fetch collection, on success, start a router, and render the views
		YellowRed.searched_profiles = new YellowRed.Collections.SearchedProfiles();
		YellowRed.searched_profiles.fetch({
			success: function () {
				new YellowRed.Routers.Home();
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
