<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('WORDPRESS_DB_NAME') );

/** MySQL database username */
define( 'DB_USER', getenv('WORDPRESS_DB_ADMIN') );

/** MySQL database password */
define( 'DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD_ADMIN') );

/** MySQL hostname */
define( 'DB_HOST', getenv('WORDPRESS_DB_HOST') );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/** from xchen */
define('WP_ALLOW_REPAIR', true);

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'hv28m??bdil,[WxCq[xbv+.IA,GX`!ntHvoyMA6q^}rb!+R1b]UmniaSUP$Iy;}>');
define('SECURE_AUTH_KEY',  '>R;!MEcL.xkJ%@[.g`CW^.v%k[N,=sa:H{jA1e#A{]kTBo])*P;7yB T?C$C-Lu!');
define('LOGGED_IN_KEY',    'I+B6qN~ ?clxmT0;l]z|i!VQ7Q]Dh~PO}}6$axhBAII3{B2pwV{he%5Ntm_b#5wa');
define('NONCE_KEY',        'kA#|>|T7vO|4PH@q[3m?4>Mpkfwz0o+G2-s^iV+X~^Dd0*(0!Nl4<g~sQrUMYTCQ');
define('AUTH_SALT',        ';)PyMTO7#QClU+|~VJLk*[|]1aO+HK5vPY4ukN` ?z1+0ePm8P_VCbG[G5yL1q.{');
define('SECURE_AUTH_SALT', '(A7#hT&~@G#Nodu?`~6r?X(_SI@soD!3QTOQ8;NFKMz^ru-VaTLK_V}gGY=F*$R7');
define('LOGGED_IN_SALT',   'IC)So^#?++cq0oRFT^`dt<0[cAf]cbpepduB|<Dp|?+m{=P]2%+8O_$+(~e`<U=#');
define('NONCE_SALT',       'dq19-Y_N=0!-|~/ZAa{c!za~EwKwop {`kwu_KBR_:NN8U1V apM|6d~vGk/k+<G');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */

/** to create use at initiation */
define( 'PLUGINDIR', dirname(__FILE__) . '/wp-content/mu-plugins' );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
