# learn-nginx
NGINX Fundamentals: High Performance Servers from Scratch - by Ray Vilijoen on Udemy 


**NGINX** is a reverse proxy server at its core and was created in 2004 by russian developer Igor Sysoev as a replacement of Apache capable of handling 10,000 concurrent connections with focus on:
- High Performance.
- High Concurrency.
- Low Resource Usage.

[What is NGINX](https://www.nginx.com/resources/glossary/nginx/) <br>
[C10k Problem](https://en.wikipedia.org/wiki/C10k_problem)


## NGINX Vs Apache
- Architecture: By default, Apacahe is configured in `prefork mode` meaning it spons a set number of processes each of which can serve a single request at a time regardless of whether that request is for a script or a images. NGINX on the other hand, deals with the request asynchronously meaning a single NGINX process can serve multiple requests concurrently. Because of this asynchronous design NGINX unlike Apache can't embed server side programming languages into its own processes, meaning that all requests for dynamic content has to be dealt with by a completely separate process like PHP FPM and then reverse proxy back to the client via NGINX. Of course, not having to deal directly with embedded programming languages like Apache does makes NGINX a lot less resource hungry. Now, this doesn't mean that the resources used for the processing of server side languages is simply freed up. Rather, they are being allocated elsewhere, like in the most common case of PHP to the FPM process. But it does mean that unlike Apache, the server side language modules don't need to be run for every single request the server receives. Instead, NGINX will handle serving static resources without ever knowing about it, whereas Apache will handle every request with that costly overhead. And this is exactly where the real world savings on system resources come into effect. So essentially a well configured NGINX Web server serving mixed content, meaning both static and dynamic resources, should always be more efficient and less demanding on system resources than a similar Apache set up.

- Performance: NGINX can't magically deliver data to the client any faster than the Internet connection will allow. But it can serve static resources much faster than Apache and handle a much larger number of concurrent requests. Remember, NGINX will serve static resources without the need to involve any server side languages, and this gives it quite an advantage over Apache. And as for handling concurrent requests, NGINX can potentially receive thousands of requests on a single processing thread and respond to them as fast as it can without turning down any of those requests. Apache, on the other hand, will accept requests up to the pre configured number and then simply reject the rest. So if we define performance or being fast in terms of how many clients can be served under high load, assuming the usual mix of static and dynamic resources, then NGINX is definitely faster than Apache.

- Configuration: NGINX's configuration also takes a very different approach to Apache's in that request, I interpret it as URI locations first, whereas Apache default to and highly favors filesystem locations. This preference for filesystem locations can also be seen in the use of .htaccess files for overriding
specific directory configurations. NGINX doesn't offer any similar functionality, but seeing as Apache's .htaccess overrides carries significant performance penalty, they shouldn't really be considered an advantage. It's also because of this very design of interpreting requests as URI locations that allows NGINX to easily function as not only a Web server but anything from a load balancer to a mail server. 

[Google trends - NGINX](https://trends.google.com/trends/explore?date=all&q=nginx)
