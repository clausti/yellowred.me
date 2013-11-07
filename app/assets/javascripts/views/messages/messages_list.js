YellowRed.Views.MessagesList = Backbone.View.extend({
	// initialize with a collection
	
	initialize: function() {
		this.listenTo( this.collection, 
										"add remove change sync reset", 
										this.render)
	},
	
  template: JST['messages/card'],
	
	render: function() {
		var that = this
		this.$el.html('');
		this.collection.each( function (message) {
			that.$el.append(that.template({
				message: message
			}))
		});
		return this;
	}

});