jQuery(function($) {
	
	$(document).on('click', '.deletePost', (function() {
		var current_post_li = $(this).parents('li')[0];

			$.ajax({
				url: '/posts/'+$(current_post_li).attr('post_id'),
				type: 'POST',
				data: {_method: 'DELETE'},
				success: function() {
					$(current_post_li).slideUp(300);
				}
			});

	}));

});