YellowRed.Views.BoxList = Backbone.View.extend(_.extend({
	// initialize with a collection
	
	initialize: function(options) {
    this.maybe = options.maybe;
    this.listenTo( this.collection, 
                    "add remove change",
                    this.render)
	},
	
  template: JST['profiles/mini_card'],
    
	events: {
    "click .star": "starProfile",
		"click .unstar": "unStarProfile",
    "mousedown .mini-profile-card": "activateProfileCard",
    "mouseup .mini-profile-card": "linkProfile"
	},
	
	render: function() {
		var that = this
    this.$el.html('')
		this.collection.each( function (profile) {
			that.$el.append(that.template({
        maybe_state: that.maybe,
				profile: profile
			}))
		});
		return this;
	},

}, YellowRed.profile_button_responses));