class FollowToggle {
  constructor(el) {

    this.$el = $(el);
    this.userId = $el.data('user-id');
    this.followState = $el.data('initial-follow-state');

    this.render();
  }

  render() {
    if (this.followState === unfollowed) {
      this.$el.prop('disabled', false);
      this.$el.text('Unfollow!');
    } else {
      this.$el.prop('disabled', false);
      this.$el.text('Follow!');
    }
  }

  handleClick() {
    event.preventDefault();
    followT = this;

    if (this.followState === unfollowed) {
      $.ajax({
        url: `/users/${id}/follow`,
        type: 'POST',
        dataType: 'json',
        success: function() {
          followT.followState = followed;
          followT.render();
      }});
    } else {
      $.ajax({
        url: `/users/:id/follow`,
        type: 'DELETE', 
        dataType: 'json',
        success: function() {
          followT.followState = unfollowed;
          followT.render();
      }});
    }
  }


}

module.export = FollowToggle;