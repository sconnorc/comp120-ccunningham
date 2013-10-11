README.md
Assignment #1: Optimizing Frogger
Connor Cunningham
*********************************************

OPTIMIZATION TECHNIQUES
^^^^^^^^^^^^^^^^^^^^^^^  
	- Minification: Minified JS and CSS files (also removed comments),
		reducing overall project size and making network requests quicker.

	- Compression: Compressed PNG images to speed network requests;
		reduced image size ~70%.

	- Combination of JS Requests: Combined all JS requests in one script
		to reduce number of network requests.

	- Content Organization: Loaded CSS first and JS last to make page more
		presentable for slower network speeds; page builds before JS
		is requested.

	- HTML5 Offline Application Cache: See Below


HTML5 OFFLINE APPLICATION CACHE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
		To increase the load speed of the page and to allow offline access,
	the offline application cache was implemented with a cache manifest.
	The manifest attribute was added to the HTML tag in index.html, and 
	"offline.appcache" was defined to store the correct files in the browser
	for offline reference.  The cache manifest did not include any files
	under a network header because I did not require network connectivity
	for access to any files.  The cache manifest also did not include any
	files under fallback as a means to keep project size to a minimum.


TOOLS
^^^^^
	- Google's Minify: Allowed for simple minification and combination
		of JS files. Although the "min" directory is significantly larger
		than the rest of the files, I was able to remove unnecessary
		components to keep the overall project under 500KB.  Minify
		reduced the number of network requests made and significantly
		improved the load time of the page.

	- jscompress.com: Reduced JS file size to decrease project size and
		quicken network requests.

	- csscompressor.com: Reduced CSS file size to decrease project size
		and quicken network requests.

	- tinypng.org: Reduced PNG file size to decrease project size and
		quicken network requests.

	- YSlow: Used to provide stats and grading on website speed and
		efficiency; also suggested modifications for optimization.

	- PageSpeed Insights (Google): Similar to YSlow; provided details
		on how to increase page speed and utelize available tools.

	- tools.pingdom.com/fpt: Showed all network requests and average
		time per request.

	- Chrome Developer Tools: Provided stats on caching, network
		requests, and website bugs.

	- FireBug (Firefox): Provided stats on caching, network
		requests, and website bugs.

	- validator.w3.org: Provided standardized validation for HTML5
		code.


PERFORMANCE IMPROVEMENTS
^^^^^^^^^^^^^^^^^^^^^^^^
	- Load Speed (non-cached): Before optimizing the page, the
		first-time load speed ranged from 2 - 2.5 seconds.
		After utelizing optimization techniques, the page load speed
		ranged from 500 - 600 milliseconds. (Measured in Dev. Tools)

	- Load Speed (cached): Before optimizing the page, the load speed
		ranged from 400 - 500 milliseconds.  After utelizing
		optimization techniques, the page load speed ranged from 
		50 - 60 milliseconds. (Measured in Dev. Tools)

	- Page Size: Before optimizing the page, the browser loaded a total
		of 151KB after all requests.  After utelizing optimization
		tecnhniques, the browser loaded a total of 37.9KB

	- YSlow: Before optimizing the page, YSlow ranked the page with 
		a B (83).  After utelizing optimization techniques, the YSlow
		ranked the page with an A (95).


PERFORMANCE ISSUES
^^^^^^^^^^^^^^^^^^
	- expires: No expires attributes were used in meta tags because
		the frogger program is static in nature.  If the game were
		under development, an expire could be added or a manual cache
		refresh could be triggered by adding version names to each
		file.

	- high score database: References to the high score database were
		removed to reduce network requests (as suggested in assignment
		description).




