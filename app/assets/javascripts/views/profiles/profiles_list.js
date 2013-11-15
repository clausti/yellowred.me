YellowRed.Views.ProfilesList = Backbone.View.extend(_.extend({
	// initialize with a collection
	
	initialize: function(options) {
    this.header = options.sectionHeader;
    this.listenTo( this.collection, 
                    "add remove change",
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
    "mousedown .profile-card": "activateProfileCard",
    "click .profile-card": "linkProfile",
	},
	
	render: function() {
    console.log('render' + this.collection.url)
    this.$el.html('');
    this.$el.html(this.header);
		var that = this
		this.collection.each( function (profile) {
			that.$el.append(that.template({
				profile: profile
			}))
		});
    this.$el.find(".profile-thumb-photo").draggable({
        revert: true,
        stack: ".profile-thumb-photo",
        opacity: 0.35,
        start: YellowRed.profile_button_responses.startDrag,
        stop: YellowRed.profile_button_responses.stopDrag
    });
		return this;
	},

}, YellowRed.profile_button_responses));