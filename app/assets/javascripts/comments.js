jQuery(function($) {
	
	$(document).on('click', '.deleteComment', (function() {
		var current_comment_li = $(this).parents('li')[0];

			$.ajax({
				url: '/comments/'+$(current_comment_li).attr('comment_id'),
				type: 'POST',
				data: {_method: 'DELETE'},
				success: function() {
					$(current_comment_li).fadeOut(150);
				}
			});

	}));
	
	$(document).on('click', '.new_comment', (function() {
		var current_post_li = $(this).parents('li')[0];
		var current_post_comment_form = $(this).siblings('.comment_form');
		var current_post_new_comment_button = $(this);
		$.ajax({
			url: '/posts/'+$(current_post_li).attr('post_id')+'/comments/new',
			success: function() {
					current_post_comment_form.delay(100).fadeIn();			
			}
		});		
	}));

});