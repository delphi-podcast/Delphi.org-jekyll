---
id: 3059
title: 'Google Cloud Shell Network Details'
date: '2018-03-14T20:53:22-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=3059'
permalink: /2018/03/google-cloud-shell-network-details/
tags:
    - Cloud
---

Marco Cantu's blog post about <a href="http://blog.marcocantu.com/blog/2018-march-delphi-linux-google-cloud-shell.html">Running a Delphi Linux Application on Google Cloud Shell</a> got me wondering more about the <a href="https://cloud.google.com/shell/">Google Cloud Shell,</a> specifically around the networking. First of all, is the IP address public?

```bash
jim@cloudshell:~$ hostname -I
172.18.0.1 172.17.0.2
jim@cloudshell:~$ curl icanhazip.com
35.199.148.57
```

So the private IP is different from the public IP. I'll need to test to see if it is mapped with NAT or something. Seems unlikely though. Google offers public facing computers as part of their cloud services, so it makes sense that you would use those instead.

Next question is around bandwidth.

```python
curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
```

Results in . . .

<pre>Retrieving speedtest.net configuration...
Testing from Google Cloud (35.199.148.57)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by Mimosa Networks (San Jose, CA) [17.60 km]: 40.662 ms
Testing download speed........
Download: 322.69 Mbit/s
Testing upload speed........
Upload: 260.94 Mbit/s</pre>

322.69 Mbit/s down and 260.94 Mbit/s up is really impressive! So if you have a task that requires a lot of bandwidth and then condenses it down to a smaller digest, it would be a really useful platform. You can access it at [console.cloud.google.com](https://console.cloud.google.com/home/dashboard?cloudshell=true).
