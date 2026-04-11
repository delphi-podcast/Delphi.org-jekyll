<%*
let title = tp.file.title
if (title.startsWith("Untitled")) {
    title = await tp.system.prompt("Post Title")
    let slug = title.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '')
    let date = tp.date.now("YYYY-MM-DD")
    await tp.file.rename(`${date}-${slug}`)
}
-%>
---
title: '<% title %>'
date: '<% tp.date.now("YYYY-MM-DDTHH:mm:ss-06:00") %>'
author: 'Jim McKeeth'
layout: post
categories:
    - News
tags:
    - 
---