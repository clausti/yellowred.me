YellowRed.Views.BoxList = Backbone.View.extend({
	// initialize with a collection
	
	initialize: function(options) {
    this.maybe = options.maybe;
    this.listenTo( this.collection, 
                    "change", 
                    this.render)
	},
	
  template: JST['profiles/mini_card'],
    
	events: {
    "mousedown .mini-profile-card": "activateProfileCard",
    "mouseup .mini-profile-card": "linkProfile"
	},
	
	render: function() {
    console.log(this.maybe);
		var that = this
		this.collection.each( function (profile) {
			that.$el.append(that.template({
        maybe_state: that.maybe,
				profile: profile
			}))
		});
		return this;
	},
  
	activateProfileCard: function(event) {
		if (!$(event.target).is("button")) {
      $(event.currentTarget).toggleClass("profile-card-active");
		}
	},
	
	linkProfile: function(event) {
		if (!$(event.target).is("button")) {
      $(event.currentTarget).toggleClass("profile-card-active", false);
			var username = $(event.currentTarget).attr("data-username");
			YellowRed.appRouter.navigate(username, {trigger: true});	
		}
	},

});