# Obsidian Setup Guide for Jekyll

To seamlessly write Jekyll posts using Obsidian, follow these steps to automate file naming and YAML front matter generation.

## 1. Install Obsidian
If you haven't already, download and install Obsidian (https://obsidian.md). Open your `delphiorg.github.io` repository as your Vault.

## 2. Install and Configure the "Templater" Plugin
1. Go to **Settings > Community plugins**.
2. Turn off "Safe mode" if prompted.
3. Click **Browse** and search for **Templater**. Install and enable it.
4. Go to the **Templater settings**.
5. Set the **Template folder location** to a new folder (e.g., `_obsidian_templates`).
6. Enable **Trigger Templater on new file creation**.
7. Under **Folder Templates**, add a new rule:
   - Folder: `_posts`
   - Template: Select your Jekyll Post Template (which we will create next).

## 3. Create the Jekyll Post Template
Create a new file in your `_obsidian_templates` folder called `Jekyll Post.md` and paste the following content:

```yaml
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

Write your post here...
```

## 4. Usage
Now, whenever you create a new note inside the `_posts` folder in Obsidian, it will prompt you for a title, automatically rename the file to the Jekyll slug format (`YYYY-MM-DD-your-title`), and inject the correct YAML front matter.
