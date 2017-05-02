<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wordpress');

/** MySQL database password */
define('DB_PASSWORD', 'wordpress');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '&uebGGCZQ=k|u~? z;P#PB4aA:&a~IiX`e3s)Qo_jggEZJJ[oHtZLSO{7<5u?CXv');
define('SECURE_AUTH_KEY',  '_q[dZ^V<2g#8M3@urld7Kc|tT&>71g3IGqp&<Y}~Ii^CDR{2VaD?Rwu*E7~(ykI&');
define('LOGGED_IN_KEY',    'wPWuFk~TF}oZ%KL+q+B2bzq3uu<&alS68@VV2vWjv]-gf9nU)+GxZaBp-ksLhz}0');
define('NONCE_KEY',        'q8A/OK=Zm!uSxbF-{yNsBL`AU]Lp^?xFZUsMFW%,j coFDBLW$Q2*BpuS`@?|fl5');
define('AUTH_SALT',        ' YZu#cl_?Jx2=!pslB`~GBo<HqOj($m[5N|od5M(wm+g1beZ*k9Om}w_cyGQqjWW');
define('SECURE_AUTH_SALT', '+t-evp~s8*z<eBHYznLDjW%<~,Fa)$pi,bbAoUB>&8q.y#5!Qd|W5hs/+&1){E]v');
define('LOGGED_IN_SALT',   'j@P(TXW~aVW.>!lI8-wP{v&TAAd9*LicGMV)ydAv//v2^vTK*/e}%%swf(Rk}uP:');
define('NONCE_SALT',       '!f+W$Lh]=))+h+*<ot|E7/ m`IAf!gnx|Tg|`MIS.!DZNnV:~_b!SEjfT63{`W#e');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
