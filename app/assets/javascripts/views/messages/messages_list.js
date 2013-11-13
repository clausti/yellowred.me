YellowRed.Views.MessagesList = Backbone.View.extend({
	// initialize with a collection
	
	initialize: function() {
		this.listenTo( this.collection, 
										"add remove change sync reset", 
										this.render)
	},
  
  events: {
    "click #new-message": "displayNewForm",
    "click .message-card": "displayMessageDetail",
    "click .message-detail": "displayMessageList",
    "click .delete-message": "deleteMessage"
  },
	
  template: JST['messages/card'],
	
	render: function() {
		var that = this;
    this.$el.html("<div id='new-message' class='button new-message-button' data-id='messages'>New Message</div>");
		this.collection.each( function (message) {
			that.$el.append(that.template({
				message: message, 
        listData: JST['messages/list']({
          message: message
        })
			}))
		});
		return this;
	},
  
  displayNewForm: function() {
    YellowRed.appRouter.navigate('new-message', {trigger:true});
  },
  
  displayMessageDetail: function(event) {
    var htmlId = $(event.currentTarget).attr("id");
    var messageId = $(event.currentTarget).attr("data-id");
    
    var messageCard = $("#" + htmlId);
    var messageCardContent = $("#" + "message-" + messageId + "-content")

    var message = this.collection.get(messageId)
    var messageDetail = JST['messages/detail']({
         message: message
    });
    messageCardContent.html(messageDetail);
    messageCardContent.attr("style", "width:100%");
    messageCard.toggleClass("message-detail", true);
    messageCard.toggleClass("message-card", false);
  },
  
  displayMessageList: function(event) {
    var htmlId = $(event.currentTarget).attr("id");
    var messageId = $(event.currentTarget).attr("data-id");
    
    var messageCard = $("#" + htmlId);
    var messageCardContent = $("#" + "message-" + messageId + "-content")
    
    var message = this.collection.get(messageId);
    var messageList = JST['messages/list']({
         message: message
    });
    messageCardContent.html(messageList);
    messageCardContent.removeAttr("style")
    messageCard.toggleClass("message-detail", false);
    messageCard.toggleClass("message-card", true);
  },
  
  deleteMessage: function(event) {
    console.log("clicked to delete message");
    var msgId = $(event.currentTarget).attr('data-id');
    var message = YellowRed.messages.get(msgId);
    message.destroy({
      wait: true, 
      success: function() {
        console.log('deleted messge' + msgId)
      }
    });
  }
  
});