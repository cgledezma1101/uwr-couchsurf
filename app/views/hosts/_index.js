$(document).ready(function()
{
	$('.j-add-host-btn').on('click', function(event)
	{
		event.preventDefault();
		event.stopPropagation();

		var $button = $(event.target);

		var $modalBody = $button.parents('.modal-content').find('.modal-body');
		var $alertsPanel = $modalBody.find('.alerts-panel');
		$alertsPanel.children().remove();
		$alertsPanel.hide();

		var name = $modalBody.find('.j-name-input').val();
		var email = $modalBody.find('.j-email-input').val();
		var phone = $modalBody.find('.j-phone-input').val();
		var adminCode = $modalBody.find('.j-code-input').val();

		var hasErrors = false;
		if (!name)
		{
			$('<p>You need to provide your name</p>').appendTo($alertsPanel);
			hasErrors = true;
		}

		if (!email && !phone)
		{
			$('<p>You need to provide an email or phone so that your occupants can contact you</p>').appendTo($alertsPanel);
			hasErrors = true;
		}

		if (!adminCode)
		{
			$('<p>You need an admin code to be able to edit your details afterwards</p>').appendTo($alertsPanel);
			hasErrors = true;
		}

		if (hasErrors)
		{
			$alertsPanel.show();
			return;
		}

		$button.hide();
		$button.siblings('.ajax-loader').show();

		var queryParts = {
			name: name || undefined,
			email: email || undefined,
			phone: phone || undefined,
			adminCode: adminCode || undefined
		};

		var queryFilter = Object.keys(queryParts)
			.filter(function (key)
			{
				return queryParts[key];
			})
			.map(function (key)
			{
				return key + '=' + queryParts[key];
			})
			.join('&');

		console.log(queryFilter);

		$.post('/hosts?' + queryFilter).done(function()
		{
			$button.parents('.modal').modal('hide');
		})
		.fail(function()
		{
			$('<p>There was an error saving the new host. Please try again</p>').appendTo($alertsPanel);
			$alertsPanel.show();
		})
		.always(function()
		{
			$button.show();
			$button.siblings('.ajax-loader').hide();
		});
	});
});
