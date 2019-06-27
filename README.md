# PageSpeed Insights dockerized [![Donate](https://liberapay.com/assets/widgets/donate.svg)](https://liberapay.com/rakshazi/donate)

Very simple script (check `psi.sh`) which will make API calls to PageSpeed Insights and show report in terminal.

Example:

```bash
$ docker run -it --rm rakshazi/psi https://forestguild.club https://forestguild.club/mythic

[psi::mobile] score: 70/100, SLOW loading (website loading - SLOW)
[psi::desktop] score: 100/100, AVERAGE loading (website loading - AVERAGE)
[psi::url] https://developers.google.com/speed/pagespeed/insights/?url=https://forestguild.club
```

## Usage

```bash
$ docker run -it --rm rakshazi/psi URL1 URL2 URL3 URL...
```

> Check example above
