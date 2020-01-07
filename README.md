# Documentation

This project is focused on bringing you everyday new wallpaper at 12 pm ( *optional* ) from unsplash.com.

## Unsplash API

After dowloading project, you should generate your own client_id and replace it, because of limited 50 requests per hour. It could be problem if this project was used simultaneously with more people.

[Link for generatting your own **client_id**](https://unsplash.com/oauth/applications)

## Replacing client id

Replace it in file **main.sh** in function **set photo ()**

```bash
wget -q http://api.unsplash.com/photos/random/client_id=YOUR_CLIENT_ID

```

## Setting up specific time

If you wanna different time for refreshing your wallpaper you can change it in file **main.sh** in function **main ()**.


```bash
specific_time="YOUR_TIME"
```

## Setting up cron

Cron is service for scheduling tasks. Typing this command will open cron table.

```bash
crontab -e
````

Write this command to crontab.

```bash
* * * * * (cd /home/USERNAME/PATH_TO_PROJECT; ./main.sh)
```

5 * means that program will execute every minute. Clicking on this [Manual](https://crontab.guru/#*_*_*_*_*) will tell you how to operate with *