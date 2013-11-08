window.YellowRed = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		console.log("initialized")
		YellowRed.appRouter = new YellowRed.Routers.App({
			central_content: $("#central-content"),
			search_results: $("#search-results")
		});
		Backbone.history.start();
		$("#current-user-thumbnail-utility").on("click", function() {
			console.log("clicked on thumbnail utility");
			YellowRed.appRouter.navigate("profile", { trigger: true} )
		});
		
  }
};

$(document).ready(function(){
  YellowRed.initialize();
});
