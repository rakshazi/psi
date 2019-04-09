# PageSpeed Insights dockerized

Very simple script (check `psi.sh`) which will make API calls to PageSpeed Insights and show report in terminal.

Example:

```bash
$ docker run -it --rm rakshazi/psi https://forestguild.club
[psi::mobile] score: 70/100, SLOW loading (website loading - SLOW)
[psi::desktop] score: 100/100, AVERAGE loading (website loading - AVERAGE)
[psi::url] https://developers.google.com/speed/pagespeed/insights/?url=https://forestguild.club
```

## Usage

```bash
$ docker run -it --rm rakshazi/psi URL
```

> Check example above
