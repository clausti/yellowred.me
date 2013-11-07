window.YellowRed = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		console.log("initialized")
		new YellowRed.Routers.App({
			central_content: $("#central-content"),
			search_results: $("#search-results")
		});
		Backbone.history.start();
  }
};

$(document).ready(function(){
  YellowRed.initialize();
});
