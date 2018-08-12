# Using the cli to get secure link for nginx
- syntax:
  `python secure.py http://example.com/secret_page.html <put here secret string> --period=30`
- example:
  1.  `python secure-link.py http://192.168.56.101/proxy-me/WebHD_720p.mp4 donguyenha --period=1`
  2.  result `http://192.168.56.101/proxy-me/WebHD_720p.mp4?md5=uaB9kUjr3V-VhPjnKpgzjg&expires=1534141522`
- [config nginx](https://raw.githubusercontent.com/alochym01/wowza/master/nginx/localhost.conf) for local web server running at 127.0.0.1, has a WebHD_720p.mp4 file
- [config nginx](https://raw.githubusercontent.com/alochym01/wowza/master/nginx/secure-link.conf) for web server running at 192.168.56.101. This server acts as reverse proxy
- access to result of cli
- `--period` time valids in days unit
