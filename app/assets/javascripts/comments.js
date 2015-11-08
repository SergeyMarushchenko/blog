jQuery(function($) {
	
	$(document).on('click', '.deleteComment', (function() {
		var current_comment_li = $(this).parents('li')[0];

			$.ajax({
				url: '/comments/'+$(current_comment_li).attr('comment_id'),
				type: 'POST',
				data: {_method: 'DELETE'},
				success: function() {
					$(current_comment_li).fadeOut(200);
				}
			});

	}));
	
	$(document).on('click', '.new_comment', (function() {
		var current_post_li = $(this).parents('li')[0];
		var current_post_comment_form = $(this).siblings('.comment_form');
		//$('.comment_form').hide(200);
		$.ajax({
			url: '/posts/'+$(current_post_li).attr('post_id')+'/comments/new',
			success: function() {
					current_post_comment_form.fadeToggle();
					('.new_comment').slideUp(50);
					//$('#comment_form').slideToggle(300);
			}
		});		
	}));

});