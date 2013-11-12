YellowRed.Views.ProfilesList = Backbone.View.extend(_.extend({
	// initialize with a collection
	
	initialize: function() {
		this.listenTo( this.collection, 
										"add remove change sync reset", 
										this.render)
	},
	
  template: JST['profiles/card'],
	
	events: {
		"click .star": "starProfile",
		"click .maybe": "maybeProfile",
		"click .nope": "nopeProfile",
		"click .unstar": "unStarProfile",
		"click .unmaybe": "unMaybeProfile",
		"click .unnope": "unNopeProfile",
		"click .profile-card": "linkProfile",
		"click #current-user-thumbnail-utility": "linkMyProfile",
	},
	
	render: function() {
		var that = this
		this.$el.html('');
		this.collection.each( function (profile) {
			that.$el.append(that.template({
				profile: profile
			}))
		});
		return this;
	},
	
	linkProfile: function(event) {
		if (!$(event.target).is("button")) {
			var username = $(event.currentTarget).attr("data-username");
			YellowRed.appRouter.navigate(username, {trigger: true});	
		}
	},

}, YellowRed.profile_button_responses));