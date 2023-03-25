MACHINE_IP=10.129.228.60


# photobomb.js
```js
function init() {
  // Jameson: pre-populate creds for tech support as they keep forgetting them and emailing me
  if (document.cookie.match(/^(.*;)?\s*isPhotoBombTechSupport\s*=\s*[^;]+(.*)?$/)) {
    document.getElementsByClassName('creds')[0].setAttribute('href','http://pH0t0:b0Mb!@photobomb.htb/printer');
  }
}
window.onload = init;
```

pH0t0
b0Mb!

http://photobomb.htb/printer

# finding the command injection is a mind fuck ... user.txt
```
4483db9644d58867dc206c400f3d9cd7
```