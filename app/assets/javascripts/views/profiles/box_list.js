YellowRed.Views.BoxList = Backbone.View.extend(_.extend({
	// initialize with a collection
	
	initialize: function(options) {
    this.maybe = options.maybe;
    this.listenTo( this.collection, 
                    "change add remove", 
                    this.render)
	},
	
  template: JST['profiles/mini_card'],
    
	events: {
    "mousedown .mini-profile-card": "activateProfileCard",
    "mouseup .mini-profile-card": "linkProfile"
	},
	
	render: function() {
    console.log('rendering');
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